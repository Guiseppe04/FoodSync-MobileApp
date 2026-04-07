import 'package:flutter/material.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/charts/line_chart_widget.dart';
import '../../widgets/charts/bar_chart_widget.dart';
import '../../widgets/charts/pie_chart_widget.dart';
import '../../widgets/charts/customer_chart_widget.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Analytics Dashboard")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔥 TABS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tab("Overview", 0),
                _tab("Products", 1),
                _tab("Customers", 2),
              ],
            ),

            const SizedBox(height: 20),

            if (selectedTab == 0) ...[
              const LineChartWidget(),
              const SizedBox(height: 20),
              const PieChartWidget(),
            ] else if (selectedTab == 1) ...[
              const BarChartWidget(),
            ] else ...[
              const CustomerChartWidget(), // 👈 DITO PAPASOK
            ],
          ],
        ),
      ),

      bottomNavigationBar: BottomNav(
        index: 4,
        onTap: (i) {
          final routes = [
            '/home',
            '/inventory',
            '/sales',
            '/logistics',
            '/analytics',
          ];
          if (i != 4) {
            Navigator.pushReplacementNamed(context, routes[i]);
          }
        },
      ),
    );
  }

  Widget _tab(String text, int index) {
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selectedTab == index ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedTab == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
