import 'package:flutter/material.dart';
import '../../widgets/inventory_item.dart';
import '../../widgets/inventory_stats.dart';
import '../../widgets/inventory_filter.dart';
import '../../widgets/bottom_nav.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  int currentIndex = 1;

  String searchText = "";

  final List<Map<String, dynamic>> items = [
    {
      "name": "Wireless Mouse",
      "sku": "WM-001",
      "stock": 45,
      "price": "₱29.99",
      "location": "Warehouse A",
      "category": "Electronics",
    },
    {
      "name": "USB-C Cable",
      "sku": "UC-002",
      "stock": 15,
      "price": "₱12.99",
      "location": "Warehouse A",
      "category": "Electronics",
    },
    {
      "name": "Laptop Stand",
      "sku": "LS-003",
      "stock": 78,
      "price": "₱49.99",
      "location": "Warehouse B",
      "category": "Accessories",
    },
    {
      "name": "Mechanical Keyboard",
      "sku": "MK-004",
      "stock": 32,
      "price": "₱89.99",
      "location": "Warehouse A",
      "category": "Electronics",
    },
    {
      "name": "Monitor 27\"",
      "sku": "MN-005",
      "stock": 8,
      "price": "₱299.99",
      "location": "Warehouse C",
      "category": "Electronics",
    },
    {
      "name": "Desk Lamp",
      "sku": "DL-006",
      "stock": 56,
      "price": "₱34.99",
      "location": "Warehouse B",
      "category": "Lighting",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 🔍 FILTER LOGIC
    final filteredItems = items.where((item) {
      final name = item["name"].toLowerCase();
      final sku = item["sku"].toLowerCase();
      final query = searchText.toLowerCase();

      return name.contains(query) || sku.contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(title: const Text("Inventory Management")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const InventoryStats(),

            const SizedBox(height: 20),

            InventoryFilter(
              onSearch: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // 🔥 LIST
            Column(
              children: filteredItems.map((item) {
                return InventoryItem(
                  name: item["name"],
                  sku: item["sku"],
                  stock: item["stock"],
                  price: item["price"],
                  location: item["location"],
                  category: item["category"],
                );
              }).toList(),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNav(
        index: currentIndex,
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
