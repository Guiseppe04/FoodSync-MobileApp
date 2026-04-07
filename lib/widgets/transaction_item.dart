import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String id, time, items, amount, type;

  const TransactionItem(
      this.id, this.time, this.items, this.amount, this.type,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$id\n$time • $items"),
          Text(amount),
        ],
      ),
    );
  }
}