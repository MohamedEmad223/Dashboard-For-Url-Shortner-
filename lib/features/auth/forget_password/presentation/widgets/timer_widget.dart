import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final String timeText;

  const TimerWidget({
    super.key,
    required this.timeText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE0F5F4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1A8A85).withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.timer_outlined,
            size: 20,
            color: Color(0xFF1A8A85),
          ),
          const SizedBox(width: 8),
          Text(
            'Resend code in $timeText',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A8A85),
            ),
          ),
        ],
      ),
    );
  }
}

