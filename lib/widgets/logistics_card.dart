import 'package:flutter/material.dart';

class LogisticsCard extends StatelessWidget {
  final String title, value;
  final Color color;

  const LogisticsCard(this.title, this.value, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(Icons.circle, color: color),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ),
    );
  }
}