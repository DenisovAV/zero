import 'package:episode_1/services/dummy_planet_service.dart';
import 'package:episode_1/services/planet_service.dart';

PlanetService getPlanetService() {
  return DummyPlanetService();
}