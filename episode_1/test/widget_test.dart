import 'package:bloc_test/bloc_test.dart';
import 'package:episode_1/business/planet_bloc.dart';
import 'package:episode_1/domain/planet.dart';
import 'package:episode_1/ui/planet_screen.dart';
import 'package:episode_1/ui/widgets/planet_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

const testPlanet = Planet(
    name: 'Uranus',
    price: '600',
    description: 'This is Uranus',
    image: 'assets/uranus.png');

class MockPlanetBloc extends MockBloc<PlanetState> implements PlanetBloc {}

void main() {
  group('detail tests', () {
    testWidgets(
      'detailsTest',
      (tester) async {
        final widget = PlanetDetails(testPlanet);

        await tester.pumpWidget(
          MaterialApp(
            home: widget,
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byWidget(widget), findsOneWidget);
      },
    );
  });

  group('main widget tests', () {
    Widget widget;
    Widget mainWidget;
    PlanetBloc bloc;

    setUp(() {
      bloc = MockPlanetBloc();
      widget = PlanetScreen();
      mainWidget = MaterialApp(
        home: BlocProvider<PlanetBloc>(
          create: (_) => bloc,
          child: widget,
        ),
      );
    });

    tearDown(() {
      bloc.close();
    });

    testWidgets(
      'mainTest',
      (tester) async {
        when(bloc.state).thenReturn(PlanetLoadedState(planets: [testPlanet]));

        await tester.pumpWidget(mainWidget);

        await tester.pumpAndSettle();
        expect(find.byWidget(widget), findsOneWidget);
      },
    );

    testWidgets(
      'mainLoadingTest',
      (tester) async {
        when(bloc.state).thenReturn(PlanetInitialState());

        await tester.pumpWidget(mainWidget);

        await tester.idle();
        await tester.pump(Duration.zero);
        expect(find.byKey(const ValueKey('loading')), findsOneWidget);
      },
    );
  });
}
