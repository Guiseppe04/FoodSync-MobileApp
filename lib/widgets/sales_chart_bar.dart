import 'package:flutter/material.dart';

class SalesChartBar extends StatelessWidget {
  const SalesChartBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(7, (i) {
          final heights = [80, 120, 150, 110, 130, 160, 140];
          return Container(
            width: 12,
            height: heights[i].toDouble(),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
          );
        }),
      ),
    );
  }
}