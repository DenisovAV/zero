import 'package:episode_1/domain/planet.dart';

abstract class PlanetService {
  Future<List<Planet>> getPlanets();
}


