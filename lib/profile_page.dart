import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName = "Nabila Cake"; // Nama pengguna dinamis
  final String userEmail = "nabila.cake@example.com"; // Email pengguna dinamis

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.green[700], // Sesuaikan warna dengan AppBar di home_page
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto Profil dan Nama
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile_picture.jpg'), // Pastikan path gambar benar
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userName, // Nama pengguna
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      userEmail, // Email pengguna
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              
              // Menu Profil
              const Text(
                'Menu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.account_circle, color: Colors.green),
                title: const Text('Edit Profil'),
                onTap: () {
                  // Navigasi ke halaman edit profil
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.green),
                title: const Text('Pengaturan'),
                onTap: () {
                  // Navigasi ke halaman pengaturan
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications, color: Colors.green),
                title: const Text('Notifikasi'),
                onTap: () {
                  // Navigasi ke halaman notifikasi
                },
              ),
              ListTile(
                leading: const Icon(Icons.help_outline, color: Colors.green),
                title: const Text('Pusat Bantuan'),
                onTap: () {
                  // Navigasi ke halaman pusat bantuan
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Keluar'),
                onTap: () {
                  // Aksi logout
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
