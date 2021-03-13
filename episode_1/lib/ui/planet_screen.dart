import 'package:episode_1/business/planet_bloc.dart';
import 'package:episode_1/domain/planet.dart';
import 'package:episode_1/ui/widgets/planet_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanetScreen extends StatefulWidget {
  final ValueChanged<Planet> onTapped;
  const PlanetScreen(this.onTapped);

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
      child: BlocBuilder<PlanetBloc, PlanetState>(builder: (context, state) {
        if (state is PlanetLoadedState) {
          return PlanetGrid(
              planets: state.planets, onTapPlanet: (planet) => widget.onTapped(planet));
        } else {
          return const Center(
            key: const ValueKey('loading'),
            child: CircularProgressIndicator(),
          );
        }
      }),
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
