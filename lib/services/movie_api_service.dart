import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/movie.dart';

class MovieApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['TMDB_BASE_URL']!,
      queryParameters: {
        'api_key': dotenv.env['TMDB_API_KEY'],
        'language': 'en-US',
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<Movie>> getPopularMovies() async {
    final response = await _dio.get('/movie/popular');
    final results = response.data['results'] as List;
    return results.map((json) => Movie.fromJson(json)).toList();
  }
}