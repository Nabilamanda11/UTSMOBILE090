import 'package:flutter/material.dart';
import 'package:flutter_cake/cart.dart';
import 'package:flutter_cake/profile_page.dart';
import 'package:flutter_cake/history_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text(
          'Welcome Nabila Cake',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HistoryPage(transactionHistory: [],)),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image (Banner)
          Positioned.fill(
            child: Image.asset(
              'assets/banner_background.jpg', // Gambar Banner sebagai background
              fit: BoxFit.cover,
            ),
          ),
          // Content on top of the background image
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Button Menu Cake
                Container(
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/cake_banner.jpg'), // Banner untuk menu cake
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MenuPage(category: 'Cake'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.cake, color: Colors.white), // Simbol Cake
                    label: const Text(
                      'Lihat Menu Cake',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Button Menu Minuman
                Container(
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/drink_banner.jpg'), // Banner untuk menu minuman
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MenuPage(category: 'Minuman'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.local_drink, color: Colors.white), // Simbol Minuman
                    label: const Text(
                      'Lihat Menu Minuman',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Button Profil
                Container(
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/profile_banner.jpg'), // Banner untuk profil
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.person, color: Colors.white), // Simbol Profil
                    label: const Text(
                      'Lihat Profil',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman MenuPage yang menampilkan grid item berdasarkan kategori
class MenuPage extends StatelessWidget {
  final String category;

  const MenuPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = _getItemsByCategory(category);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text(
          'Menu $category',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      'assets/${item['image']}', // Mengambil gambar dari daftar data
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rp${item['price']}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const CartPage(item: {}, quantity: null,)),
                            );
                          },
                          icon: const Icon(Icons.add_shopping_cart, size: 14),
                          label: const Text('Keranjang'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Fungsi untuk mendapatkan daftar item berdasarkan kategori
  List<Map<String, String>> _getItemsByCategory(String category) {
    if (category == 'Cake') {
      return [
        {'name': 'Tiramisu Cake', 'price': '23000', 'image': 'cake0.jpg'},
        {'name': 'Chocolate Cake', 'price': '21000', 'image': 'cake1.jpg'},
        {'name': 'Cheese Cake', 'price': '26000', 'image': 'cake2.jpg'},
        {'name': 'Red Velvet Cake', 'price': '33000', 'image': 'cake3.jpg'},
        {'name': 'Lemon Cake', 'price': '28000', 'image': 'cake4.jpg'},
        {'name': 'Strawberry Cake', 'price': '30000', 'image': 'cake5.jpg'},
      ];
    } else {
      return [
        {'name': 'Berry Mocktail', 'price': '20000', 'image': 'minuman0.jpg'},
        {'name': 'Green Tea', 'price': '25000', 'image': 'minuman1.jpg'},
        {'name': 'Berry Smoothie', 'price': '26000', 'image': 'minuman2.jpg'},
        {'name': 'Latte', 'price': '22000', 'image': 'minuman3.jpg'},
        {'name': 'Milkshake', 'price': '26000', 'image': 'minuman4.jpg'},
        {'name': 'Lemon Tea', 'price': '18000', 'image': 'minuman5.jpg'},
      ];
    }
  }
}