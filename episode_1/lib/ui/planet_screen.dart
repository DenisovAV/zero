import 'package:episode_1/domain/planet.dart';
import 'package:episode_1/ui/widgets/planet_grid.dart';
import 'package:flutter/material.dart';

class PlanetScreen extends StatefulWidget {
  final ValueChanged<Planet> onTapped;
  final List<Planet> planets;
  const PlanetScreen({
    required this.onTapped,
    required this.planets,
  });

  @override
  State<StatefulWidget> createState() => _PlanetScreenState();
}

class _PlanetScreenState extends State<PlanetScreen> {
  Widget _buildTitle() {
    return Center(
      child: Text(
        'Planets Market',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPlanetGrid() {
    return Expanded(
      child: PlanetGrid(planets: widget.planets, onTapPlanet: (planet) => widget.onTapped(planet)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTitle(),
            _buildPlanetGrid(),
          ],
        ),
      ),
    );
  }
}
