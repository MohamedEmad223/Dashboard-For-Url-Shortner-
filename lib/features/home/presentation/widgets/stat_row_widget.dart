import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatRowWidget extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;
  final IconData icon;

  const StatRowWidget({
    required this.label,
    required this.value,
    required this.valueColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.cairo(
            color: const Color(0xFF4A5568),
            fontSize: 13,
          ),
        ),
        const Spacer(),

        Text(
          value,
          style: GoogleFonts.cairo(
            color: valueColor,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
        const SizedBox(width: 8),
        Icon(icon, size: 16, color: const Color(0xFF8A94A6)),
      ],
    );
  }
}
