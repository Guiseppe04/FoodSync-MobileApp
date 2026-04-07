import 'package:flutter/material.dart';

class LogisticsOrderItem extends StatelessWidget {
  final String id;
  final String customer;
  final String amount;
  final String status;

  const LogisticsOrderItem({
    super.key,
    required this.id,
    required this.customer,
    required this.amount,
    required this.status,
  });

  Color getStatusColor() {
    switch (status) {
      case "delivered":
        return Colors.green;
      case "cancelled":
        return Colors.red;
      case "processing":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(id),
        subtitle: Text(customer),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(amount),
            const SizedBox(height: 5),
            Text(
              status,
              style: TextStyle(
                color: getStatusColor(),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}