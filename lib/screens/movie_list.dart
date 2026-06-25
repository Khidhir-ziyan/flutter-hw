import 'package:flutter/material.dart';
import '../bloc/movie_bloc.dart';
import 'movie_detail.dart';
import 'favorite_page.dart';

class MovieListPage extends StatefulWidget {
  final MovieBloc movieBloc;

  const MovieListPage({
    super.key,
    required this.movieBloc,
  });

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  // Contoh data movie (nanti bisa diganti dengan data dari API atau BLoC)
  final List<Map<String, String>> movies = [
    {
      'title': 'Inception',
      'release': '2010',
      'genre': 'Sci-Fi, Action',
      'rating': '8.8',
      'director': 'Christopher Nolan',
      'synopsis': 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.',
    },
    {
      'title': 'The Dark Knight',
      'release': '2008',
      'genre': 'Action, Crime',
      'rating': '9.0',
      'director': 'Christopher Nolan',
      'synopsis': 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
    },
    {
      'title': 'Interstellar',
      'release': '2014',
      'genre': 'Sci-Fi, Adventure',
      'rating': '8.6',
      'director': 'Christopher Nolan',
      'synopsis': "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F13),
      appBar: AppBar(
        backgroundColor: const Color(0xFF17171D),
        title: const Text('MovieNest'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FavoritePage(
                    movieBloc: widget.movieBloc,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          final isFavorite = widget.movieBloc.isFavorite(movie);

          return Card(
            color: const Color(0xFF1E1E24),
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                movie['title']!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    '${movie['release']} • ${movie['genre']}',
                    style: const TextStyle(color: Colors.white54),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie['rating']!,
                        style: const TextStyle(color: Colors.amber),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white54,
                ),
                onPressed: () {
                  setState(() {
                    if (isFavorite) {
                      widget.movieBloc.removeFavorite(movie);
                    } else {
                      widget.movieBloc.addFavorite(movie);
                    }
                  });
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MovieDetail(
                      movie: movie,
                      movieBloc: widget.movieBloc,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
