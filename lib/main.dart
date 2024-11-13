import 'package:flutter/material.dart';
import 'dart:async';
import 'login.dart'; // Pastikan login_page.dart sudah diimport

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nabila Manda Ceriana',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer untuk navigasi ke halaman login setelah 5 detik
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()), // Arahkan ke LoginPage
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan teks "Welcome Nabila Bakery App"
            const Text(
              'Welcome Nabila Bakery App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            // Menampilkan foto profil sebagai lingkaran
            ClipOval(
              child: Image.asset(
                'assets/profil.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover, // Agar gambar menyesuaikan dengan bentuk lingkaran
              ),
            ),
            const SizedBox(height: 20),
            Icon(
              Icons.cake,
              size: 100,
              color: Colors.green[800],
            ),
            const SizedBox(height: 20),
            const Text(
              'Nabila Manda Ceriana\n15-2022-090',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
