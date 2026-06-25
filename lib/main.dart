import 'package:flutter/material.dart';
import 'bloc/movie_bloc.dart';
import 'screens/movie_list.dart';  // Import ini

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MovieBloc movieBloc = MovieBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieNest',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFF0F0F13),
        useMaterial3: true,
      ),
      home: WelcomeScreen(movieBloc: movieBloc),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final MovieBloc movieBloc;

  const WelcomeScreen({
    super.key,
    required this.movieBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... semua kode WelcomeScreen sama seperti sebelumnya
      body: Container(
        // ... kode yang sama
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ... semua widget yang sama sampai tombol

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MovieListPage(
                            movieBloc: movieBloc,
                          ),
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
