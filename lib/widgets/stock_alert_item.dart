import 'package:flutter/material.dart';

class StockAlertItem extends StatelessWidget {
  final String name, sku, warehouse, units, min;

  const StockAlertItem(
      this.name, this.sku, this.warehouse, this.units, this.min,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$name\nSKU: $sku"),
          Text(units),
        ],
      ),
    );
  }
}