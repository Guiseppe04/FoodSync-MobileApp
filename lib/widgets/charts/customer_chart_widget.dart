import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomerChartWidget extends StatelessWidget {
  const CustomerChartWidget({super.key});

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
            child: Text("Customer Growth"),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                borderData: FlBorderData(show: false),

                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 180),
                      FlSpot(1, 210),
                      FlSpot(2, 190),
                      FlSpot(3, 240),
                      FlSpot(4, 220),
                      FlSpot(5, 270),
                    ],
                    isCurved: true,
                    color: Colors.green,
                    barWidth: 3,
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