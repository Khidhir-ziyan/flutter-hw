import 'package:equatable/equatable.dart';
import '../models/movie.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object?> get props => [];
}

// Ambil daftar movie (dari API, fallback ke local storage)
class FetchMovies extends MovieEvent {}

// Toggle favorite
class ToggleFavorite extends MovieEvent {
  final Movie movie;
  const ToggleFavorite(this.movie);

  @override
  List<Object?> get props => [movie];
}