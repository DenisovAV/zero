import 'package:episode_1/domain/planet.dart';
import 'package:flutter/material.dart';

class PlanetDetails extends StatelessWidget {
  final Planet planet;
  PlanetDetails(this.planet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 256.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: planet.name,
                child: Image.network(
                  planet.image,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  planet.name,
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    planet.description,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
