import 'dart:async';

import 'package:episode_1/domain/planet.dart';
import 'package:episode_1/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanetBloc extends Bloc<PlanetEvent, PlanetState> {
  late final StreamSubscription planetSubscription;

  PlanetBloc() : super(PlanetInitialState());

  @override
  Stream<PlanetState> mapEventToState(PlanetEvent event) async* {
    if (event is PlanetInitialEvent) {
      print('6');
      planetSubscription = getPlanetService().getPlanets().listen((planets) {
        print('7');
        add(PlanetUpdateEvent(planets: planets));
      });
    } else if (event is PlanetUpdateEvent) {
      yield PlanetLoadedState(planets: event.planets);
    }
  }

  @override
  Future<void> close() {
    planetSubscription.cancel();
    return super.close();
  }
}

abstract class PlanetEvent {}

class PlanetInitialEvent extends PlanetEvent {}

class PlanetUpdateEvent extends PlanetEvent {
  final List<Planet> planets;

  PlanetUpdateEvent({this.planets = const []});
}

abstract class PlanetState {}

class PlanetInitialState extends PlanetState {}

class PlanetLoadedState extends PlanetState {
  final List<Planet> planets;

  PlanetLoadedState({this.planets = const []});
}
