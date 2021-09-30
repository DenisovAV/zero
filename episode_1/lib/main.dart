import 'dart:async';

import 'package:episode_1/ui/planets_root.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'business/planet_bloc.dart';
import 'business/auth_bloc.dart';

import 'init/init_strategy.dart' if (dart.library.html) 'init/init_strategy.web.dart';

String? name;

void main() async {
  runZonedGuarded<Future<void>>(() async {
    initializeApp();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FlutterError.onError = recordFlutterError;

    runApp(MyApp());
  }, (error, stack) => recordError(error, stack));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
        create: (_) => AuthBloc()..add(AuthenticateEvent()),
        child: BlocProvider<PlanetBloc>(
          create: (_) => PlanetBloc()..add(PlanetInitialEvent()),
          child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is AuthenticatedState) {
              return BlocBuilder<PlanetBloc, PlanetState>(builder: (context, state) {
                if (state is PlanetLoadedState) {
                  return PlanetsRoot(
                    planets: state.planets,
                  );
                } else {
                  return const Center(
                    key: const ValueKey('loading'),
                    child: CircularProgressIndicator(),
                  );
                }
              });
            } else {
              return const Center(
                key: const ValueKey('loading'),
                child: CircularProgressIndicator(),
              );
            }
          }),
        ));
  }
}
