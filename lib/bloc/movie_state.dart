import 'package:equatable/equatable.dart';
import '../models/movie.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object?> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;
  final List<Movie> favorites;

  const MovieLoaded({
    required this.movies,
    required this.favorites,
  });

  bool isFavorite(Movie movie) =>
      favorites.any((m) => m.id == movie.id);

  @override
  List<Object?> get props => [movies, favorites];
}

class MovieError extends MovieState {
  final String message;
  const MovieError(this.message);

  @override
  List<Object?> get props => [message];
}