import 'package:flutter/material.dart';

class InventoryStats extends StatelessWidget {
  const InventoryStats({super.key});

  Widget box(String title, String value, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(title, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 5),
            Text(value,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            box("Total Products", "8", Colors.blue),
            box("In Stock", "5", Colors.green),
          ],
        ),
        Row(
          children: [
            box("Low Stock", "3", Colors.orange),
            box("Out of Stock", "0", Colors.red),
          ],
        ),
      ],
    );
  }
}