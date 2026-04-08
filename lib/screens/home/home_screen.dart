import 'package:flutter/material.dart';
import '../../widgets/dashboard_card.dart';
import '../../widgets/payment_chart.dart';
import '../../widgets/transaction_item.dart';
import '../../widgets/stock_alert_item.dart';
import '../../widgets/sales_chart.dart';
import '../../widgets/app_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: "Food Sync",
      currentIndex: 0,

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
              "Dashboard",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            const Text(
              "Real-time overview of your retail operations",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            const DashboardCard(title: "Total Sales", value: "₱8567.72"),
            const DashboardCard(title: "Total Orders", value: "15"),
            const DashboardCard(title: "Low Stock Items", value: "3"),
            const DashboardCard(title: "Active Shipments", value: "6"),

            const SizedBox(height: 20),

            const SalesChart(),

            const SizedBox(height: 20),

            const PaymentChart(),

            const SizedBox(height: 20),

            const Text(
              "Recent Transactions",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Column(
              children: const [
                TransactionItem(
                  "S0021",
                  "10:20 PM",
                  "5 items",
                  "₱267.97",
                  "GCash",
                ),
                TransactionItem(
                  "S0021",
                  "10:19 PM",
                  "1 item",
                  "₱361.48",
                  "GCash",
                ),
                TransactionItem(
                  "S0021",
                  "10:18 PM",
                  "5 items",
                  "₱331.20",
                  "Cash",
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Low Stock Alerts",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Column(
              children: const [
                StockAlertItem(
                  "USB-C Cable",
                  "UC-002",
                  "Warehouse A",
                  "15 units",
                  "20",
                ),
                StockAlertItem(
                  "Monitor 27\"",
                  "MN-005",
                  "Warehouse C",
                  "8 units",
                  "10",
                ),
              ],
            ),
          ],
        ),
      ),

    
    );
  }
}
