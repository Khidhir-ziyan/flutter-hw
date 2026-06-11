import 'package:flutter/material.dart';
import 'movie_detail.dart';

// State favorit disimpan di sini agar bisa dishare antar halaman
final Set<String> favoriteMovies = {};

final List<Map<String, String>> movies = [
  {'title': 'Interstellar', 'release': '2013', 'rating': '8.6', 'genre': 'Sci-Fi', 'director': 'Christopher Nolan', 'synopsis': 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.'},
  {'title': 'The Dark Knight', 'release': '2008', 'rating': '9.0', 'genre': 'Action', 'director': 'Christopher Nolan', 'synopsis': 'When the menace known as the Joker wreaks havoc on Gotham City, Batman must accept one of the greatest tests of his ability to fight injustice.'},
  {'title': 'Inception', 'release': '2010', 'rating': '8.8', 'genre': 'Thriller', 'director': 'Christopher Nolan', 'synopsis': 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.'},
];

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  void _toggleFavorite(String title) {
    setState(() {
      if (favoriteMovies.contains(title)) {
        favoriteMovies.remove(title);
      } else {
        favoriteMovies.add(title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F13),
      appBar: AppBar(
        backgroundColor: const Color(0xFF17171D),
        title: const Text('Movie List', style: TextStyle(fontWeight: FontWeight.w700)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Badge(
              isLabelVisible: favoriteMovies.isNotEmpty,
              label: Text(favoriteMovies.length.toString()),
              child: const Icon(Icons.favorite, color: Colors.pinkAccent),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          final isFav = favoriteMovies.contains(movie['title']);

          return Card(
            color: const Color(0xFF17171D),
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MovieDetail(movie: movie),
                  ),
                );
                // Refresh state saat balik dari detail
                setState(() {});
              },
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade800,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.movie, color: Colors.white70),
              ),
              title: Text(
                movie['title']!,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    Text(movie['release']!, style: const TextStyle(color: Colors.white38, fontSize: 13)),
                    const SizedBox(width: 10),
                    const Icon(Icons.star, color: Color(0xFFFFC107), size: 14),
                    const SizedBox(width: 3),
                    Text(movie['rating']!, style: const TextStyle(color: Color(0xFFFFC107), fontSize: 13, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.pinkAccent : Colors.white38,
                ),
                onPressed: () => _toggleFavorite(movie['title']!),
              ),
            ),
          );
        },
      ),
    );
  }
}
