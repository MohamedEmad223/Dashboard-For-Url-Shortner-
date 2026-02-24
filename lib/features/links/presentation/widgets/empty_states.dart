import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/pressable_card.dart';

class EmptyStates extends StatelessWidget {
  const EmptyStates({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFFF0FAFB),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFCCEEF2), width: 2),
            ),
            child: const Icon(Icons.link_off_rounded,
                size: 36, color: Color(0xFFB0D8DC)),
          ),
          const SizedBox(height: 16),
          Text(
            'لا توجد روابط',
            style: GoogleFonts.cairo(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF4A5568),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'أنشئ رابطك الأول الآن',
            style: GoogleFonts.cairo(
              fontSize: 13,
              color: const Color(0xFF8A94A6),
            ),
          ),
          const SizedBox(height: 20),
          PressableCard(
            onTap: () {},
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF076475), Color(0xFF13C5D8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0B8A9A).withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add_rounded,
                      color: Colors.white, size: 18),
                  const SizedBox(width: 6),
                  Text(
                    'إنشاء رابط جديد',
                    style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}