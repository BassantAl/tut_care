import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.status,
  });

  final int status;

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;

    switch (status) {
      case 0:
        color = Colors.orange;
        text = 'Pending';
        break;

      case 1:
        color = Colors.green;
        text = 'Confirmed';
        break;

      case 2:
        color = Colors.blue;
        text = 'Completed';
        break;

      case 4:
        color = Colors.red;
        text = 'Cancelled';
        break;

      default:
        color = Colors.grey;
        text = 'Unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}