import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../widgets/app_layout.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: "Payment Management",

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
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                double width = (constraints.maxWidth / 2) - 10;

                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    SizedBox(
                      width: width,
                      child: _card("Total Revenue", "₱5892.92", "+12.5%"),
                    ),
                    SizedBox(
                      width: width,
                      child: _card(
                        "Cash Payments",
                        "₱1774.39",
                        "4 transactions",
                      ),
                    ),
                    SizedBox(
                      width: width,
                      child: _card(
                        "GCash Payments",
                        "₱4118.53",
                        "16 transactions",
                      ),
                    ),
                    SizedBox(
                      width: width,
                      child: _card(
                        "Reconciliation",
                        "Complete",
                        "Last sync: 2 min ago",
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            _section("Payment Method Distribution"),

            Container(
              height: 220,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 40,
                        sections: [
                          PieChartSectionData(
                            value: 1774,
                            color: Colors.green,
                            radius: 50,
                            title: '',
                          ),
                          PieChartSectionData(
                            value: 4118,
                            color: Colors.blue,
                            radius: 50,
                            title: '',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.green, size: 10),
                          SizedBox(width: 5),
                          Text("Cash"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.blue, size: 10),
                          SizedBox(width: 5),
                          Text("GCash"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _section("Daily Payment Breakdown"),

            Container(
              height: 220,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(show: false),
                  barGroups: [
                    _bar(0, 5000, 7000),
                    _bar(1, 4000, 6000),
                    _bar(2, 6500, 8000),
                    _bar(3, 6000, 7500),
                    _bar(4, 7800, 9000),
                    _bar(5, 5500, 6800),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            _section("Recent Payment Transactions"),

            _transaction("S0001", "₱191.48", "GCash"),
            _transaction("S0002", "₱541.49", "Cash"),
            _transaction("S0003", "₱280.69", "GCash"),
          ],
        ),
      ),
    );
  }

  Widget _card(String title, String value, String sub) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(sub, style: const TextStyle(color: Colors.green)),
        ],
      ),
    );
  }

  Widget _section(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _transaction(String id, String amount, String type) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(id),
          Text(amount),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: type == "GCash" ? Colors.blue : Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(type, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _bar(int x, double cash, double gcash) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: cash, color: Colors.green, width: 8),
        BarChartRodData(toY: gcash, color: Colors.blue, width: 8),
      ],
    );
  }
}
