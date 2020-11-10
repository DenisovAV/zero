import 'package:episode_1/business/planet_bloc.dart';
import 'package:episode_1/ui/planet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<PlanetBloc>(
        create: (_) => PlanetBloc()..add(PlanetEvent.initializing),
        child: PlanetScreen(),
      ),
    );
  }
}
