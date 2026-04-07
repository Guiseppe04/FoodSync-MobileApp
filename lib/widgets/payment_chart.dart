import 'package:flutter/material.dart';

class PaymentChart extends StatelessWidget {
  const PaymentChart({super.key});

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
          const Text("Payment Distribution",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Container(
            width: 140,
            height: 140,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [Colors.green, Colors.green, Colors.blue, Colors.blue],
              ),
            ),
          ),
        ],
      ),
    );
  }
}