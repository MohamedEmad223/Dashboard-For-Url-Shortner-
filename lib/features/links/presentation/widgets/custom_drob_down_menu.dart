import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrobDownMenu extends StatelessWidget {
  final List<String> items;
  final String selected;
  final ValueChanged<String> onSelect;

  const CustomDrobDownMenu({
    super.key,
    required this.items,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: items.map((item) {
          final isSelected = item == selected;
          return GestureDetector(
            onTap: () => onSelect(item),
            child: Container(
              width: double.infinity,
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFE0F5F7)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  if (isSelected)
                    const Icon(Icons.check_rounded,
                        size: 16, color: Color(0xFF0B8A9A)),
                  const Spacer(),
                  Text(
                    item,
                    style: GoogleFonts.cairo(
                      fontSize: 13,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: isSelected
                          ? const Color(0xFF0B8A9A)
                          : const Color(0xFF0F1E2E),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}