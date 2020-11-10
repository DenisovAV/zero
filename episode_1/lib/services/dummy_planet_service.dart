import 'package:episode_1/domain/planet.dart';
import 'package:episode_1/services/planet_service.dart';

class DummyPlanetService implements PlanetService {
  Future<List<Planet>> getPlanets() async {
    return [
      Planet(
          name: 'Mercury',
          price: '100',
          description: 'This is Mercury',
          image: 'assets/mercury.png'),
      Planet(
          name: 'Venus',
          price: '150',
          description: 'This is Venus',
          image: 'assets/venus.png'),
      Planet(
          name: 'Earth',
          price: '500',
          description: 'This is Earth',
          image: 'assets/earth.png'),
      Planet(
          name: 'Mars',
          price: '200',
          description: 'This is Mars',
          image: 'assets/mars.png'),
      Planet(
          name: 'Jupiter',
          price: '800',
          description: 'This is Jupiter',
          image: 'assets/jupiter.png'),
      Planet(
          name: 'Saturn',
          price: '700',
          description: 'This is Saturn',
          image: 'assets/saturn.png'),
      Planet(
          name: 'Uranus',
          price: '600',
          description: 'This is Uranus',
          image: 'assets/uranus.png'),
      Planet(
          name: 'Neptune',
          price: '400',
          description: 'This is Neptune',
          image: 'assets/neptune.png'),
      Planet(
          name: 'Sun',
          price: '2000',
          description: 'This is Sun',
          image: 'assets/sun.png'),
      Planet(
          name: 'Moon',
          price: '50',
          description: 'This is Earth',
          image: 'assets/mercury.png'),
    ];
  }
}
