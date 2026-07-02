import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/movie.dart';
import '../services/movie_api_service.dart';

class MovieRepository {
  final MovieApiService _apiService = MovieApiService();
  static const String _cacheKey = 'cached_movies';

  Future<List<Movie>> getPopularMovies() async {
    try {
      //dari API
      final movies = await _apiService.getPopularMovies();

      //Kalau berhasil, simpan ke local storage buat cache
      await _saveToCache(movies);

      return movies;
    } catch (e) {
      //Kalau gagal (misal gak ada internet), ambil dari cache
      final cachedMovies = await _getFromCache();

      if (cachedMovies.isNotEmpty) {
        return cachedMovies;
      }

      //Kalau cache juga kosong, baru lempar error
      throw Exception('Gagal mengambil data dan tidak ada cache tersimpan');
    }
  }

  Future<void> _saveToCache(List<Movie> movies) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = movies.map((m) => m.toJson()).toList();
    await prefs.setString(_cacheKey, jsonEncode(jsonList));
  }

  Future<List<Movie>> _getFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_cacheKey);

    if (jsonString == null) return [];

    final jsonList = jsonDecode(jsonString) as List;
    return jsonList.map((json) => Movie.fromJson(json)).toList();
  }
}