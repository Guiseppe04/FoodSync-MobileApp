import 'package:flutter/material.dart';
import '../../widgets/logistics_card.dart' as card;
import '../../widgets/logistics_order_item.dart' as order;
import '../../widgets/bottom_nav.dart';

class LogisticsScreen extends StatelessWidget {
  const LogisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(title: const Text("Logistics & Tracking")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: card.LogisticsCard("Pending", "2", Colors.orange),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: card.LogisticsCard("Processing", "3", Colors.blue),
                ),
              ],
            ),

            SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: card.LogisticsCard("Shipped", "3", Colors.purple),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: card.LogisticsCard("Delivered", "3", Colors.green),
                ),
              ],
            ),

            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Active Orders",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10),

            order.LogisticsOrderItem(
              id: "ORD00001",
              customer: "Customer 1",
              amount: "₱1068.11",
              status: "cancelled",
            ),

            order.LogisticsOrderItem(
              id: "ORD00002",
              customer: "Customer 2",
              amount: "₱125.79",
              status: "delivered",
            ),

            order.LogisticsOrderItem(
              id: "ORD00003",
              customer: "Customer 3",
              amount: "₱168.69",
              status: "cancelled",
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNav(
        index: 3,
        onTap: (i) {
          final routes = [
            '/home',
            '/inventory',
            '/sales',
            '/logistics',
            '/analytics',
          ];
          Navigator.pushReplacementNamed(context, routes[i]);
        },
      ),
    );
  }
}
