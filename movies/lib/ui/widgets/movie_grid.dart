import 'package:flutter/material.dart';
import 'package:movies/domain/movie.dart';
import 'package:movies/ui/focus/extensions.dart';
import 'package:movies/ui/widgets/movie_card/movie_card.dart';
import 'package:movies/ui/widgets/platform.dart';

typedef MovieTapHandler = void Function(Movie);

class MovieGrid extends StatelessWidget {
  MovieGrid({
    required this.movies,
    required this.onTapMovie,
    Key? key,
  }) : super(key: key);

  final controller = ScrollController();
  final List<Movie> movies;
  final MovieTapHandler onTapMovie;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(28),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MyPlatform.isTv ? 5 : (context.screenSize.width / 250).round(),
              childAspectRatio: 1.2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => getMovieCard()(
                movie: movies[index],
                index: index,
                onTap: () => onTapMovie(movies[index]),
              ),
              childCount: movies.length,
            ),
          ),
        )
      ],
    );
  }
}
