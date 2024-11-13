import 'package:flutter/material.dart';

// Model untuk data transaksi
class Transaction {
  final String item;
  final int quantity;
  final double price;

  Transaction({
    required this.item,
    required this.quantity,
    required this.price,
  });

  double get totalPrice => price * quantity;
}

class HistoryPage extends StatelessWidget {
  final List<Transaction> transactionHistory;

  const HistoryPage({super.key, required this.transactionHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pesanan'),
        backgroundColor: Colors.green[700],
      ),
      body: transactionHistory.isEmpty
          ? const Center(
              child: Text(
                'Daftar Pesanan Berhasil Kosong',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: transactionHistory.length,
              itemBuilder: (context, index) {
                final transaction = transactionHistory[index];
                return ListTile(
                  title: Text(transaction.item),
                  subtitle: Text('Jumlah: ${transaction.quantity}'),
                  trailing: Text('Rp ${transaction.totalPrice.toStringAsFixed(2)}'),
                );
              },
            ),
    );
  }
}
