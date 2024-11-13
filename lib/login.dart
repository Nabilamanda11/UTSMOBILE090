import 'package:flutter/material.dart';
import 'package:flutter_cake/hone_page.dart';
import 'register.dart'; // Import RegisterPage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  // Simpan data pengguna yang terdaftar
  Map<String, String> registeredUsers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final username = usernameController.text;
                final password = passwordController.text;

                // Periksa apakah username dan password cocok dengan yang terdaftar
                if (registeredUsers.containsKey(username) && registeredUsers[username] == password) {
                  // Tampilkan pesan berhasil login
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Anda berhasil login'),
                      backgroundColor: Colors.green,
                    ),
                  );

                  // Navigasi ke HomePage jika login berhasil
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                } else {
                  // Tampilkan pesan kesalahan jika login gagal
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Username atau password salah'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
              ),
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () async {
                // Navigasi ke halaman registrasi dan mendapatkan data pengguna baru
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
                if (result != null) {
                  // Jika berhasil register, simpan username dan password
                  setState(() {
                    registeredUsers[result['username']] = result['password'];
                  });
                }
              },
              child: const Text(
                'Don\'t have an account? Register here',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
