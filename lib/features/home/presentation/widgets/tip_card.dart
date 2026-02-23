import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipCard extends StatelessWidget {
  const TipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('نصيحة اليوم',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(width: 8),
              const Icon(Icons.adjust, color: Colors.orange),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'استخدم الروابط المخصصة لزيادة معدل النقرات بنسبة تصل إلى 40%! الروابط المخصصة أكثر جاذبية وثقة.',
            textAlign: TextAlign.right,
            style: GoogleFonts.cairo(
                color: const Color(0xFF6B7280), fontSize: 13),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7ED),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFFED7AA)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('joc.li/math-course',
                    style: GoogleFonts.cairo(
                        color: const Color(0xFFF97316),
                        fontWeight: FontWeight.w600)),
                Column(
                  children: [
                    Text('40%+',
                        style: GoogleFonts.cairo(
                            color: const Color(0xFFF97316),
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    Text('نقرات أكثر',
                        style: GoogleFonts.cairo(fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}