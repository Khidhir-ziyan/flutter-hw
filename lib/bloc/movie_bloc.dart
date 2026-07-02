import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/movie_repository.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository _repository = MovieRepository();

  MovieBloc() : super(MovieInitial()) {
    on<FetchMovies>(_onFetchMovies);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  Future<void> _onFetchMovies(
      FetchMovies event,
      Emitter<MovieState> emit,
      ) async {
    emit(MovieLoading());
    try {
      final movies = await _repository.getPopularMovies();
      emit(MovieLoaded(movies: movies, favorites: const []));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  void _onToggleFavorite(
      ToggleFavorite event,
      Emitter<MovieState> emit,
      ) {
    final currentState = state;
    if (currentState is MovieLoaded) {
      final isFav = currentState.isFavorite(event.movie);
      final updatedFavorites = List.of(currentState.favorites);

      if (isFav) {
        updatedFavorites.removeWhere((m) => m.id == event.movie.id);
      } else {
        updatedFavorites.add(event.movie);
      }

      emit(MovieLoaded(
        movies: currentState.movies,
        favorites: updatedFavorites,
      ));
    }
  }
}