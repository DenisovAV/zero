import 'package:episode_1/domain/planet.dart';

abstract class PlanetService {
  Stream<List<Planet>> getPlanets();
}


