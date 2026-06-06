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
      title: 'Eksplorasi Widget Flutter',
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: const WidgetExplorationPage(),
    );
  }
}

class WidgetExplorationPage extends StatelessWidget {
  const WidgetExplorationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eksplorasi Widget Flutter')),
      body: SingleChildScrollView(
        // ini penting agar semua du dalam widget ini bisa di scroll
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ==========================
            // 1. PROFILE CARD
            // ==========================
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const Text(
                      'Profile Card',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person, size: 40),
                    ),
                    const SizedBox(height: 10),
                    const Text('Your name', style: TextStyle(fontSize: 20)),
                    const Text('Student at University'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const MovieList(),
                          ),
                        );
                      },
                      child: const Text('Follow'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ==========================
            // 2. DASHBOARD MENU
            // ==========================
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Dashboard Menu',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _menuItem(Icons.home, 'Home'),
                        _menuItem(Icons.favorite, 'Favorite'),
                        _menuItem(Icons.settings, 'Settings'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ==========================
            // 3. INFORMATION BANNER
            // ==========================
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Selamat datang di aplikasi eksplorasi widget Flutter.',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ==========================
            // 4. ARTICLE LIST
            // ==========================
            Card(
              elevation: 3,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Daftar Artikel',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text('Belajar Flutter Dasar'),
                  ),
                  ListTile(
                    leading: Icon(Icons.code),
                    title: Text('Pengenalan Dart'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone_android),
                    title: Text('Membuat Aplikasi Mobile'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ==========================
            // 5. SIMPLE GALLERY
            // ==========================
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Galeri Sederhana',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _galleryItem(Colors.blue),
                        _galleryItem(Colors.red),
                        _galleryItem(Colors.green),
                        _galleryItem(Colors.orange),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _menuItem(IconData icon, String title) {
    return Column(
      children: [Icon(icon, size: 35), const SizedBox(height: 5), Text(title)],
    );
  }

  static Widget _galleryItem(Color color) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Icon(Icons.image, size: 50, color: Colors.white),
      ),
    );
  }
}
