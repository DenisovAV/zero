import 'package:episode_1/ui/planets_root.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'business/planet_bloc.dart';

void main() {
  if (kIsWeb) {
    setUrlStrategy(PathUrlStrategy());
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlanetBloc>(
      create: (_) => PlanetBloc()..add(PlanetEvent.initializing),
      child: PlanetsRoot(),
    );
  }
}
