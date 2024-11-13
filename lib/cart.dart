import 'package:flutter/material.dart';
import 'history_page.dart'; // Pastikan untuk mengimpor halaman HistoryPage

class CartPage extends StatefulWidget {
  const CartPage({super.key, required Map item, required quantity});

  @override
  // ignore: library_private_types_in_public_api
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Daftar kue dan minuman beserta harga
  final List<Map<String, dynamic>> menuItems = [
    {'name': 'Tiramisu Cake', 'price': 23000},
    {'name': 'Chocolate Cake', 'price': 21000},
    {'name': 'Cheese Cake', 'price': 26000},
    {'name': 'Red Velvet Cake', 'price': 33000},
    {'name': 'Lemon Cake', 'price': 28000},
    {'name': 'Strawberry Cake', 'price': 30000},
    {'name': 'Berry Moktail', 'price': 20000},
    {'name': 'Green Tea', 'price': 25000},
    {'name': 'Berry Smoothie', 'price': 26000},
    {'name': 'Latte', 'price': 22000},
    {'name': 'Milkshake', 'price': 26000},
    {'name': 'Lemon Tea', 'price': 18000},
  ];

  // Menu yang dipilih
  final List<Map<String, dynamic>> selectedItems = [];

  // Variabel untuk menyimpan metode pembayaran yang dipilih
  String? selectedPaymentMethod;

  // Menghitung total harga
  int get totalHarga {
    return selectedItems.fold(0, (sum, item) => sum + item['price'] as int);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan total harga
            Text(
              'Total Harga: Rp$totalHarga',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            // Menampilkan daftar menu dengan checkbox
            ...menuItems.map((item) {
              return CheckboxListTile(
                title: Text(item['name']),
                subtitle: Text('Rp${item['price']}'),
                value: selectedItems.contains(item),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selectedItems.add(item);
                    } else {
                      selectedItems.remove(item);
                    }
                  });
                },
              );
            }),
            const SizedBox(height: 20),
            // Input Nama
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Input Alamat
            const TextField(
              decoration: InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Input Estimasi Jam Pengiriman
            const TextField(
              decoration: InputDecoration(
                labelText: 'Estimasi Jam Pengiriman',
                border: OutlineInputBorder(),
                hintText: 'Misal: 14:00',
              ),
            ),
            const SizedBox(height: 10),
            // Input Estimasi Jam Tiba
            const TextField(
              decoration: InputDecoration(
                labelText: 'Estimasi Jam Tiba',
                border: OutlineInputBorder(),
                hintText: 'Misal: 16:00',
              ),
            ),
            const SizedBox(height: 20),

            // Menambahkan pilihan metode pembayaran
            const Text(
              'Metode Pembayaran',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            RadioListTile<String>(
              title: const Text('Transfer Bank'),
              value: 'Transfer Bank',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Bayar di Tempat'),
              value: 'Bayar di Tempat',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // Tombol untuk melanjutkan transaksi
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedPaymentMethod == null) {
                    // Menampilkan alert jika belum memilih metode pembayaran
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pilih metode pembayaran terlebih dahulu')),
                    );
                    return;
                  }

                  // Membuat transaksi dan menambahkannya ke halaman HistoryPage
                  final transaction = Transaction(
                    item: selectedItems.map((item) => item['name']).join(', '),
                    quantity: selectedItems.length,
                    price: totalHarga.toDouble(),
                  );

                  // Pindah ke halaman HistoryPage dan pass transaksi
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryPage(transactionHistory: [transaction]),
                    ),
                  );

                  // Menampilkan dialog transaksi berhasil
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Transaksi Berhasil'),
                        content: Text(
                          'Terima kasih, pesanan Anda sedang diproses dengan metode pembayaran: $selectedPaymentMethod.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Lanjut Transaksi',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
