import 'package:flutter/material.dart';

class InventoryItem extends StatelessWidget {
  final String name, sku, price, location, category;
  final int stock;

  const InventoryItem({
    super.key,
    required this.name,
    required this.sku,
    required this.stock,
    required this.price,
    required this.location,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    bool isLow = stock <= 10;

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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isLow ? Colors.orange[100] : Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isLow ? "Low Stock" : "In Stock",
                  style: TextStyle(
                    color: isLow ? Colors.orange : Colors.white,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 5),

          Text("SKU: $sku", style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Stock"),
                  Text("$stock units",
                      style: TextStyle(
                          color: isLow ? Colors.orange : Colors.green,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Price"),
                  Text(price,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Location\n$location"),
              Text("Category\n$category"),
            ],
          ),
        ],
      ),
    );
  }
}