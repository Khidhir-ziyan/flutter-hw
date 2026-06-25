import 'dart:async';

class MovieBloc {
  // =========================
  // DATA MOVIE
  // =========================

  final List<Map<String, String>> _movies = [
    {
      'title': 'Interstellar',
      'release': '2013',
      'rating': '8.6',
      'genre': 'Sci-Fi',
      'director': 'Christopher Nolan',
      'synopsis':
          'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.'
    },
    {
      'title': 'The Dark Knight',
      'release': '2008',
      'rating': '9.0',
      'genre': 'Action',
      'director': 'Christopher Nolan',
      'synopsis':
          'When the menace known as the Joker wreaks havoc on Gotham City, Batman must accept one of the greatest tests of his ability to fight injustice.'
    },
    {
      'title': 'Inception',
      'release': '2010',
      'rating': '8.8',
      'genre': 'Thriller',
      'director': 'Christopher Nolan',
      'synopsis':
          'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.'
    },
  ];

  // =========================
  // FAVORITE STATE
  // =========================

  final List<Map<String, String>> _favoriteMovies = [];

  final StreamController<List<Map<String, String>>> _favoriteController =
      StreamController<List<Map<String, String>>>.broadcast();

  Stream<List<Map<String, String>>> get favoriteStream =>
      _favoriteController.stream;

  // =========================
  // FUTURE BUILDER SOURCE
  // =========================

  Future<List<Map<String, String>>> loadMovies() async {
    await Future.delayed(const Duration(seconds: 2));
    return _movies;
  }

  // =========================
  // FAVORITE ACTIONS
  // =========================

  void addFavorite(Map<String, String> movie) {
    final exists = _favoriteMovies.any(
      (item) => item['title'] == movie['title'],
    );

    if (!exists) {
      _favoriteMovies.add(movie);
      _favoriteController.sink.add(List.from(_favoriteMovies));
    }
  }

  void removeFavorite(Map<String, String> movie) {
    _favoriteMovies.removeWhere(
      (item) => item['title'] == movie['title'],
    );

    _favoriteController.sink.add(List.from(_favoriteMovies));
  }

  bool isFavorite(Map<String, String> movie) {
    return _favoriteMovies.any(
      (item) => item['title'] == movie['title'],
    );
  }

  List<Map<String, String>> get favorites =>
      List.unmodifiable(_favoriteMovies);

  // =========================
  // CLEANUP
  // =========================

  void dispose() {
    _favoriteController.close();
  }
}

