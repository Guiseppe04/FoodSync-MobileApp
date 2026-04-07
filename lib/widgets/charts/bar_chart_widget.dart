import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

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
            child: Text("Top Products by Revenue"),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(show: false),

                gridData: FlGridData(show: true),

                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const names = [
                          "Monitor",
                          "Keyboard",
                          "Headphones",
                          "Stand",
                          "Mouse"
                        ];
                        return Text(names[value.toInt()],
                            style: const TextStyle(fontSize: 10));
                      },
                    ),
                  ),
                ),

                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: 28000,
                        width: 14,
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blue,
                      )
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: 8000,
                        width: 14,
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blue,
                      )
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        toY: 10000,
                        width: 14,
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blue,
                      )
                    ],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                        toY: 3000,
                        width: 14,
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blue,
                      )
                    ],
                  ),
                  BarChartGroupData(
                    x: 4,
                    barRods: [
                      BarChartRodData(
                        toY: 1500,
                        width: 14,
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blue,
                      )
                    ],
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