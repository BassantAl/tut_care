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
        color = const Color(0xffF59E0B);
        text = 'Pending';
        break;

      case 1:
        color = const Color(0xff10B981);
        text = 'Confirmed';
        break;

      case 2:
        color = const Color(0xff3B82F6);
        text = 'Completed';
        break;

      case 3:
      case 4:
        color = const Color(0xffEF4444);
        text = 'Cancelled';
        break;

      default:
        color = const Color(0xff6B7280);
        text = 'Unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}