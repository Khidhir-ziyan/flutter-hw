import 'package:flutter/material.dart';
import 'screens/movie_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const WelcomeScreen(),
    );
  }
}



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A0040), Color(0xFF0F0F13), Color(0xFF0F0F13)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),

                // Logo / Icon
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.movie_filter, size: 38, color: Colors.white),
                ),

                const SizedBox(height: 32),

                // Headline
                const Text(
                  'Your movies,\nall in one place.',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                    letterSpacing: -1,
                  ),
                ),

                const SizedBox(height: 16),

                // Subtext
                const Text(
                  'Discover, track, and explore films you love.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white54,
                    height: 1.5,
                  ),
                ),

                const Spacer(flex: 2),

                // CTA Button
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      // TODO: Navigate to movie list page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MovieList()),
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
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Secondary link
                Center(
                  child: TextButton(
                    onPressed: () {
                      // TODO: Navigate to login
                    },
                    child: const Text(
                      'Already have an account? Sign in',
                      style: TextStyle(color: Colors.white38, fontSize: 14),
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
