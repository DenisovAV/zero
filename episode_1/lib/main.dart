import 'package:episode_1/ui/planets_root.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'init/init_strategy.dart' if (dart.library.html) 'init/init_strategy.web.dart';

import 'business/planet_bloc.dart';

void main() {
  initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('AAAAAAAA');
          } else if (snapshot.connectionState == ConnectionState.done) {
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
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
