import 'package:flutter/material.dart';
import '../../widgets/app_layout.dart';
import '../../widgets/sales_card.dart';
import '../../widgets/sales_chart_bar.dart';
import '../../widgets/sales_transaction_item.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: "Sales Monitoring",

      currentIndex: 2, // 🔥 sales tab

      onNavTap: (i) {
        final routes = [
          '/home',
          '/inventory',
          '/sales',
          '/logistics',
          '/analytics',
          '/settings',
        ];

        if (ModalRoute.of(context)?.settings.name == routes[i]) return;

        Navigator.pushReplacementNamed(context, routes[i]);
      },

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Track transactions and payment methods in real-time",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            const SalesCard(title: "Total Sales", value: "₱34609.55"),
            const SalesCard(title: "Cash Payments", value: "₱1629.52"),
            const SalesCard(title: "GCash Payments", value: "₱4208.96"),
            const SalesCard(title: "Avg. Transaction", value: "₱1730.48"),

            const SizedBox(height: 20),

            const SalesChartBar(),

            const SizedBox(height: 20),

            const Text(
              "Recent Transactions",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const SalesTransactionItem(
              id: "S0021",
              date: "4/7/2026, 11:54 PM",
              amount: "₱88.05",
              type: "GCash",
            ),

            const SalesTransactionItem(
              id: "S0021",
              date: "4/7/2026, 11:53 PM",
              amount: "₱160.44",
              type: "Cash",
            ),

            const SalesTransactionItem(
              id: "S0021",
              date: "4/7/2026, 11:52 PM",
              amount: "₱409.30",
              type: "Cash",
            ),
          ],
        ),
      ),
    );
  }
}