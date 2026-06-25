import 'package:flutter/material.dart';
import '../bloc/movie_bloc.dart';
import 'movie_detail.dart';

class FavoritePage extends StatelessWidget {
  final MovieBloc movieBloc;

  const FavoritePage({
    super.key,
    required this.movieBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F13),
      appBar: AppBar(
        backgroundColor: const Color(0xFF17171D),
        title: const Text(
          'Favorite Movies',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: StreamBuilder<List<Map<String, String>>>(
        stream: movieBloc.favoriteStream,
        initialData: movieBloc.favorites,
        builder: (context, snapshot) {
          final favorites = snapshot.data ?? [];

          if (favorites.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 70,
                    color: Colors.white24,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No favorite movies yet',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final movie = favorites[index];

              return Card(
                color: const Color(0xFF17171D),
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieDetail(
                          movie: movie,
                          movieBloc: movieBloc,
                        ),
                      ),
                    );
                  },
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.movie,
                      color: Colors.white70,
                    ),
                  ),
                  title: Text(
                    movie['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    "${movie['release']} • ${movie['rating']}",
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.pinkAccent,
                    ),
                    onPressed: () {
                      movieBloc.removeFavorite(movie);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
