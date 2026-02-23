import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickStatsCard extends StatelessWidget {
  const QuickStatsCard({super.key});

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
              Text('إحصائيات سريعة',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(width: 8),
              const Icon(Icons.auto_awesome, color: Color(0xFF0D7A8A)),
            ],
          ),
          const SizedBox(height: 16),
          _row('أكثر رابط زيارة', 'joc.li/top',
              const Color(0xFF1A1A2E)),
          _row('آخر رابط تم إنشاؤه', 'منذ ساعتين',
              const Color(0xFF1A1A2E)),
          _row('متوسط الزيارات', '0 زيارة',
              const Color(0xFF10B981)),
        ],
      ),
    );
  }

  Widget _row(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value,
              style: GoogleFonts.cairo(
                  color: valueColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13)),
          Text(label,
              style: GoogleFonts.cairo(
                  color: const Color(0xFF6B7280), fontSize: 13)),
        ],
      ),
    );
  }
}