import 'package:episode_1/domain/planet.dart';
import 'package:episode_1/ui/widgets/planet_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlanetGrid extends StatelessWidget {
  PlanetGrid({
    required this.planets,
    required this.onTapPlanet,
  });

  final controller = ScrollController();
  final List<Planet> planets;
  final Function(Planet) onTapPlanet;

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? Scrollbar(
            child: getGreed(context),
          )
        : getGreed(context);
  }

  Widget getGreed(BuildContext context) => CustomScrollView(
        controller: controller,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(28),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (MediaQuery.of(context).size.width / 250).round(),
                childAspectRatio: 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => PlanetCard(planets[index],
                    index: index, onTap: () => onTapPlanet(planets[index])),
                childCount: planets.length,
              ),
            ),
          )
        ],
      );
}
