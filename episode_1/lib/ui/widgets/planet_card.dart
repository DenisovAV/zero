import 'package:episode_1/domain/planet.dart';
import 'package:flutter/material.dart';

class PlanetCard extends StatelessWidget {
  const PlanetCard(
    this.planet, {
    this.onTap,
    @required this.index,
  });

  final int index;
  final Function onTap;
  final Planet planet;

  Widget _buildPlanet(double height) {
    return Positioned(
      bottom: 2,
      right: 5,
      child: Hero(
        tag: planet.name,
        child: Image.asset(
          planet.image,
          width: height * 0.75,
        ),
      ),
    );
  }

  Widget _buildPrice() {
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        '${planet.price}\$',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),
      ),
    );
  }

  Widget _buildName() {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 24),
      child: Text(
        planet.name,
        style: TextStyle(
          fontSize: 18,
          height: 0.7,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            color: Colors.teal,
            child: InkWell(
              onTap: onTap,
              child: Stack(
                children: [
                  _buildPlanet(constrains.maxHeight),
                  _buildPrice(),
                  _buildName(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
