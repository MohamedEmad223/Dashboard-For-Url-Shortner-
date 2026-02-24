import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorRow extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const ColorRow(
      {required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFEDF0F4)),
        ),
        child: Row(
          children: [
            // Color swatch
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFDDE3EC)),
              ),
            ),
            const SizedBox(width: 10),
            // Hex code
            Text(
              '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
              style: GoogleFonts.robotoMono(
                fontSize: 13,
                color: const Color(0xFF4A5568),
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            // Label
            Text(label,
                style: GoogleFonts.cairo(
                    fontSize: 13,
                    color: const Color(0xFF4A5568),
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }}