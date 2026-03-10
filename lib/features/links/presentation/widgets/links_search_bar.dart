import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinksSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const LinksSearchBar({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.right,
        style: GoogleFonts.cairo(fontSize: 14),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'البحث عن رابط...',
          hintStyle: GoogleFonts.cairo(
            color: const Color(0xFFB0BAC9),
            fontSize: 13,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: Color(0xFFB0BAC9),
            size: 20,
          ),
          filled: true,
          fillColor: const Color(0xFFF8FAFC),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFEDF0F4)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFEDF0F4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFF0B8A9A),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

