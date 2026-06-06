  import 'package:flutter/material.dart';

  class MovieList extends StatelessWidget {
    const MovieList({super.key});


    @override
    Widget build(BuildContext context) {
      final List<Map<String, String>> movies = [
        {'title': 'Interstellar', 'release': '2013', 'rating': '8.6'},
        {'title': 'The Dark Knight', 'release': '2008', 'rating': '9.0'},
        {'title': 'Inception', 'release': '2010', 'rating': '8.8'},
      ];
 
      return Scaffold(
        appBar: AppBar(title: const Text('Movie List')),
        body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: const Icon(Icons.movie),
                title: Text(movies[index]['title']!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movies[index]['release']!),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(movies[index]['rating']!),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
