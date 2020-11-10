import 'package:episode_1/domain/planet.dart';
import 'package:episode_1/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanetBloc extends Bloc<PlanetEvent, PlanetState> {
  PlanetBloc() : super(PlanetInitialState());

  @override
  Stream<PlanetState> mapEventToState(PlanetEvent event) async* {
    if (event == PlanetEvent.initializing) {
      final planets = await getPlanetService().getPlanets();
      yield PlanetLoadedState(planets: planets);
    }
  }
}

enum PlanetEvent { initializing }

abstract class PlanetState {}

class PlanetInitialState extends PlanetState {}

class PlanetLoadedState extends PlanetState {
  final List<Planet> planets;

  PlanetLoadedState({this.planets = const []});
}
