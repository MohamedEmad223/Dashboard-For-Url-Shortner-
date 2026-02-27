import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animated_card.dart';

class LableTextWidget extends StatelessWidget {
  const LableTextWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      delayMs: 80,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: GoogleFonts.cairo(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F1E2E),
          ),
        ),
      ),
    );
  }
}
