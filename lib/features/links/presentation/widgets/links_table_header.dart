import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinksTableHeader extends StatelessWidget {
  const LinksTableHeader({super.key});

  Widget _buildFixedHeaderCell(String text, double width) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.cairo(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF475569),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFixedHeaderCell('الإجراءات', 120),
            _buildFixedHeaderCell('الحالة', 100),
            _buildFixedHeaderCell('الزيارات', 100),
            _buildFixedHeaderCell('الرابط الأصلي', 250),
            Container(
              width: 200,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Text(
                'الرابط المختصر',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF475569),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

