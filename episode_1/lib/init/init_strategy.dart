import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

void initializeApp() {}

Future<void> recordFlutterError(FlutterErrorDetails flutterErrorDetails) =>
    FirebaseCrashlytics.instance.recordFlutterError(flutterErrorDetails);

Future<void> recordError(dynamic exception, StackTrace? stack,
        {dynamic reason,
        Iterable<DiagnosticsNode> information = const [],
        bool? printDetails,
        bool fatal = false}) =>
    FirebaseCrashlytics.instance.recordError(exception, stack);
