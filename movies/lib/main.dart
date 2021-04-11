import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/business/movies_bloc.dart';
import 'package:movies/framework/remote_controller.dart';
import 'package:movies/ui/focus/extensions.dart';
import 'package:movies/ui/focus/scale_widget.dart';
import 'package:movies/ui/movies_screen.dart';
import 'package:movies/ui/widgets/platform.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  RemoteController().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const screen = MoviesScreen();
    final width = WidgetsBinding.instance!.window.physicalSize.width;
    final pixelRatio = WidgetsBinding.instance!.window.devicePixelRatio;
    return MaterialApp(
      home: BlocProvider<MoviesBloc>(
          create: (_) => MoviesBloc()..add(MoviesEvent.initializing),
          child: MyPlatform.isTv
              ? ScaleWidget(
                  ratio: width / (kTvSize.width * pixelRatio),
                  child: screen,
                )
              : screen),
    );
  }
}
