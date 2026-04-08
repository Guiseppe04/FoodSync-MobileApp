import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 40),

          // HEADER
          ListTile(
            title: const Text(
              "Food Sync",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          const Divider(),

          // MENU ITEMS
          _buildItem(
            context,
            Icons.dashboard,
            "Dashboard",
            '/home',
            currentRoute,
          ),
          _buildItem(
            context,
            Icons.inventory,
            "Inventory",
            '/inventory',
            currentRoute,
          ),
          _buildItem(
            context,
            Icons.shopping_cart,
            "Sales",
            '/sales',
            currentRoute,
          ),
          _buildItem(
            context,
            Icons.local_shipping,
            "Logistics",
            '/logistics',
            currentRoute,
          ),
          _buildItem(
            context,
            Icons.bar_chart,
            "Analytics",
            '/analytics',
            currentRoute,
          ),
          _buildItem(
            context,
            Icons.payment,
            "Payments",
            '/payments',
            currentRoute,
          ),
          _buildItem(
            context,
            Icons.settings,
            "Settings",
            '/settings',
            currentRoute,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    IconData icon,
    String title,
    String route,
    String? currentRoute,
  ) {
    final isActive = currentRoute == route;

    return Container(
      color: isActive ? Colors.blue.withValues(alpha: 0.1) : null,
      child: ListTile(
        leading: Icon(icon, color: isActive ? Colors.blue : Colors.black),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.black,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () {
          Navigator.of(context).pop(); // close drawer

          if (currentRoute != route) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pushReplacementNamed(route);
          }
        },
      ),
    );
  }
}
