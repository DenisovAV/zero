import 'package:episode_1/business/planet_bloc.dart';
import 'package:episode_1/navigator/delegate.dart';
import 'package:episode_1/navigator/parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanetsRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Planets Market',
      routerDelegate: PlanetRouterDelegate(context.read<PlanetBloc>()),
      routeInformationParser: PlanetInformationParser(),
    );
  }
}
