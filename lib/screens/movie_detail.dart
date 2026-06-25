import 'package:flutter/material.dart';
import '../bloc/movie_bloc.dart';

class MovieDetail extends StatefulWidget {
  final Map<String, String> movie;
  final MovieBloc movieBloc;

  const MovieDetail({
    super.key,
    required this.movie,
    required this.movieBloc,
  });

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  bool get _isFav =>
    widget.movieBloc.isFavorite(widget.movie);

  void _toggleFavorite() {
  if (_isFav) {
    widget.movieBloc.removeFavorite(widget.movie);
  } else {
    widget.movieBloc.addFavorite(widget.movie);
  }

  setState(() {});
}

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F13),
      body: CustomScrollView(
        slivers: [
          // ── HERO HEADER ──
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: const Color(0xFF17171D),
            actions: [
              IconButton(
                icon: Icon(
                  _isFav ? Icons.favorite : Icons.favorite_border,
                  color: _isFav ? Colors.pinkAccent : Colors.white70,
                ),
                onPressed: _toggleFavorite,
                tooltip: _isFav ? 'Remove from favorites' : 'Add to favorites',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF2A0060), Color(0xFF17171D)],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Container(
                      width: 100,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade900,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withOpacity(0.4),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.movie, size: 50, color: Colors.white38),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── CONTENT ──
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Title + Favorite button
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          movie['title']!,
                          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, letterSpacing: -0.5),
                        ),
                      ),
                      GestureDetector(
                        onTap: _toggleFavorite,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: _isFav ? Colors.pink.shade900 : const Color(0xFF1E1E26),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                _isFav ? Icons.favorite : Icons.favorite_border,
                                color: _isFav ? Colors.pinkAccent : Colors.white54,
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                _isFav ? 'Saved' : 'Favorite',
                                style: TextStyle(
                                  color: _isFav ? Colors.pinkAccent : Colors.white54,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Info chips
                  Wrap(
                    spacing: 8,
                    children: [
                      _chip(Icons.calendar_today, movie['release']!),
                      _chip(Icons.category, movie['genre']!),
                      _chip(Icons.star, movie['rating']!, color: const Color(0xFFFFC107)),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Director
                  const Text('Director', style: TextStyle(fontSize: 13, color: Colors.white38, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(movie['director']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),

                  const SizedBox(height: 20),

                  // Synopsis
                  const Text('Synopsis', style: TextStyle(fontSize: 13, color: Colors.white38, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text(
                    movie['synopsis']!,
                    style: const TextStyle(fontSize: 15, color: Colors.white70, height: 1.6),
                  ),

                  const SizedBox(height: 32),

                  // Watch button
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_circle_outline),
                      label: const Text('Watch Now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(IconData icon, String label, {Color? color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E26),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color ?? Colors.white54),
          const SizedBox(width: 5),
          Text(label, style: TextStyle(fontSize: 13, color: color ?? Colors.white60)),
        ],
      ),
    );
  }
}
