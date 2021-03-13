import 'package:episode_1/domain/planet.dart';
import 'package:episode_1/navigator/delegate.dart';
import 'package:episode_1/navigator/parser.dart';
import 'package:flutter/material.dart';

class PlanetsRoot extends StatefulWidget {
  final List<Planet> planets;

  PlanetsRoot({required this.planets});

  @override
  _PlanetsRootState createState() => _PlanetsRootState();
}

class _PlanetsRootState extends State<PlanetsRoot> {
  late PlanetRouterDelegate planetRouterDelegate;
  late PlanetInformationParser planetInformationParser;

  @override
  void initState() {
    super.initState();
    planetRouterDelegate = PlanetRouterDelegate(widget.planets);
    planetInformationParser = PlanetInformationParser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Planets Market',
      routerDelegate: planetRouterDelegate,
      routeInformationParser: planetInformationParser,
    );
  }
}
