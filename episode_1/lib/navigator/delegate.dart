import 'dart:async';

import 'package:episode_1/business/planet_bloc.dart';
import 'package:episode_1/domain/planet.dart';
import 'package:episode_1/navigator/parser.dart';
import 'package:episode_1/ui/planet_screen.dart';
import 'package:episode_1/ui/widgets/planet_details.dart';
import 'package:flutter/material.dart';

class PlanetRouterDelegate extends RouterDelegate<PlanetRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PlanetRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  PlanetBloc _bloc;
  Planet? _selectedPlanet;
  List<Planet> planets = [];
  late StreamSubscription<PlanetState> _subscription;

  PlanetRouterDelegate(this._bloc) : navigatorKey = GlobalKey<NavigatorState>() {
    _subscription = _bloc.listen((state) {
      if (state is PlanetLoadedState) {
        planets = state.planets;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  PlanetRoutePath get currentConfiguration {
    return _selectedPlanet == null
        ? PlanetRoutePath.home()
        : PlanetRoutePath.details(_selectedPlanet!.name);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('PlanetsListPage'),
          child: PlanetScreen(_handlePlanetTapped),
        ),
        if (_selectedPlanet != null) PlanetDetailsPage(planet: _selectedPlanet!)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedPlanet = null;
        notifyListeners();

        return true;
      },
    );
  }

  void _handlePlanetTapped(Planet planet) {
    _selectedPlanet = planet;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(PlanetRoutePath path) async {
    if (path.isDetailsPage) {
      _selectedPlanet = planets.firstWhere((element) => element.name.toLowerCase() == path.name);
    } else {
      _selectedPlanet = null;
    }
  }
}

class PlanetDetailsPage extends Page {
  final Planet planet;

  PlanetDetailsPage({
    required this.planet,
  }) : super(key: ValueKey(planet));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return PlanetDetails(planet);
      },
    );
  }
}
