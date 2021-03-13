import 'package:flutter/material.dart';

class PlanetRoutePath {
  final String name;

  PlanetRoutePath.home() : name = '';

  PlanetRoutePath.details(this.name);

  bool get isHomePage => name == '';

  bool get isDetailsPage => name != '';
}

class PlanetInformationParser extends RouteInformationParser<PlanetRoutePath> {
  @override
  Future<PlanetRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.length == 0) {
      return PlanetRoutePath.home();
    } else {
      var name = uri.pathSegments[1];
      return PlanetRoutePath.details(name);
    }
  }

  @override
  RouteInformation restoreRouteInformation(PlanetRoutePath path) {
    if (path.isDetailsPage) {
      return RouteInformation(location: '/planet/${path.name.toLowerCase()}');
    }
    return RouteInformation(location: '/');
  }
}
