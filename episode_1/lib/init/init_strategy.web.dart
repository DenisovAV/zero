import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void initializeApp() {
  setUrlStrategy(PathUrlStrategy());
}

Future<void> recordFlutterError(FlutterErrorDetails flutterErrorDetails) async =>
    print(flutterErrorDetails);

Future<void> recordError(dynamic exception, StackTrace? stack,
        {dynamic reason,
        Iterable<DiagnosticsNode> information = const [],
        bool? printDetails,
        bool fatal = false}) async =>
    print(exception);
