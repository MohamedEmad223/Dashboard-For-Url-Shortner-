import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/pressable_card.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/screens/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkRow extends StatelessWidget {
  final Map<String, dynamic> link;
  const LinkRow({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 6, 16, 0),
        padding:
        const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFEDF0F4)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomActionButton(
                      icon: Icons.edit_outlined,
                      color: const Color(0xFF0B8A9A)),
                  const SizedBox(width: 6),
                  CustomActionButton(
                      icon: Icons.delete_outline_rounded,
                      color: const Color(0xFFE53E3E)),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: link['active'] == true
                      ? const Color(0xFFE6FAF4)
                      : const Color(0xFFFFF0E6),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  link['active'] == true ? 'نشط' : 'متوقف',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: link['active'] == true
                        ? const Color(0xFF059669)
                        : const Color(0xFFF97316),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                '${link['visits'] ?? 0}',
                textAlign: TextAlign.right,
                style: GoogleFonts.cairo(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F1E2E)),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                link['short'] ?? '',
                textAlign: TextAlign.right,
                style: GoogleFonts.cairo(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0B8A9A),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}