import 'package:movies/services/dummy_movies_service.dart';
import 'package:movies/services/movies_service.dart';

MoviesService getMoviesService() {
  return DummyMoviesService();
}
