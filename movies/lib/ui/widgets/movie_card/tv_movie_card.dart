import 'package:flutter/material.dart';
import 'package:movies/domain/movie.dart';
import 'package:movies/ui/focus/focusable.dart';
import 'package:movies/ui/widgets/movie_card/mobile_movie_card.dart';

class TvMovieCard extends StatefulWidget {
  final int index;
  final GestureTapCallback? onTap;
  final Movie movie;

  const TvMovieCard({
    required this.movie,
    required this.index,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _TvMovieCardState createState() => _TvMovieCardState();
}

class _TvMovieCardState extends State<TvMovieCard> {
  @override
  Widget build(BuildContext context) {
    return FocusableWidget(
      builder: (context, child, isFocused) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isFocused ? Colors.teal : Colors.transparent,
            width: 10,
          ),
        ),
        child: child,
      ),
      child: MovieCard(
        movie: widget.movie,
        index: widget.index,
        onTap: widget.onTap,
      ),
    );
  }
}
