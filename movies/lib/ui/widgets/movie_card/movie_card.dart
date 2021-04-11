import 'package:flutter/cupertino.dart';
import 'package:movies/domain/movie.dart';
import 'package:movies/ui/widgets/movie_card/mobile_movie_card.dart';
import 'package:movies/ui/widgets/movie_card/tv_movie_card.dart';
import 'package:movies/ui/widgets/platform.dart';

typedef MyBuilder = Widget Function({
  required Movie movie,
  required int index,
  GestureTapCallback onTap,
});

MyBuilder getMovieCard() => MyPlatform.isTv ? getTvCard : getMobileCard;

Widget getTvCard({
  required Movie movie,
  required int index,
  GestureTapCallback? onTap,
}) =>
    TvMovieCard(
      movie: movie,
      index: index,
      onTap: onTap,
    );

Widget getMobileCard({
  required Movie movie,
  required int index,
  GestureTapCallback? onTap,
}) =>
    MovieCard(
      movie: movie,
      index: index,
      onTap: onTap,
    );
