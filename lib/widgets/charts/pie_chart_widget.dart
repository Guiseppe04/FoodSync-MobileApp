import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("Sales by Category"),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: 36,
                    title: "Electronics 36%",
                    color: Colors.blue,
                  ),
                  PieChartSectionData(
                    value: 26,
                    title: "Clothing 26%",
                    color: Colors.green,
                  ),
                  PieChartSectionData(
                    value: 23,
                    title: "Stationery 23%",
                    color: Colors.orange,
                  ),
                  PieChartSectionData(
                    value: 15,
                    title: "Lighting 15%",
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}