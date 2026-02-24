import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'WELCOME BACK',
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0B8A9A),
            letterSpacing: 1.8,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Sign in to your account',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF0F1E2E),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Enter your credentials to access your account',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: const Color(0xFF8A94A6),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}