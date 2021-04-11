import 'package:movies/domain/movie.dart';

abstract class MoviesService {
  Future<List<Movie>> getMovies();
}
