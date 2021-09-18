import 'package:episode_1/ui/planets_root.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'init/init_strategy.dart' if (dart.library.html) 'init/init_strategy.web.dart';

import 'business/planet_bloc.dart';

void main() {
  initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlanetBloc>(
        create: (_) => PlanetBloc()..add(PlanetEvent.initializing),
        child: BlocBuilder<PlanetBloc, PlanetState>(builder: (context, state) {
          if (state is PlanetLoadedState) {
            return PlanetsRoot(
              planets: state.planets,
            );
          } else {
            return const Center(
              key: const ValueKey('loading'),
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
