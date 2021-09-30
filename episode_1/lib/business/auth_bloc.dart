import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final StreamSubscription authSubscription;

  AuthBloc() : super(UnresolvedAuthState()) {
    authSubscription = FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        add(SignOutEvent());
      } else {
        add(SignInEvent());
      }
    });
  }

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print(googleUser?.email);
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }

  Future<UserCredential> signInWithGoogleWeb() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({
      'login_hint': 'user@example.com'
    });
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthenticateEvent) {
      if(kIsWeb){
        signInWithGoogleWeb();
      } else {
        await signInWithGoogle();
      }
    } else if (event is SignInEvent) {
      yield AuthenticatedState();
    } else if (event is SignOutEvent) {
      yield UnauthenticatedState();
    }
  }
}

abstract class AuthEvent {}

class AuthenticateEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

abstract class AuthState {}

class UnresolvedAuthState extends AuthState {}

class AuthenticatedState extends AuthState {}

class UnauthenticatedState extends AuthState {}
