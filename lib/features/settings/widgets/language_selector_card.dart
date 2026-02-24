import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageSelectorCard extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  const LanguageSelectorCard({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'اللغة',
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: const Color(0xFF0F1E2E),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F5F7),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Icon(Icons.translate_rounded,
                    size: 17, color: Color(0xFF0B8A9A)),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'اختر اللغة المفضلة لديك',
            textAlign: TextAlign.right,
            style: GoogleFonts.cairo(
              fontSize: 13,
              color: const Color(0xFF8A94A6),
            ),
          ),
          const SizedBox(height: 16),
          // Language options
          Row(
            children: [
              Expanded(
                child: _LanguageOption(
                  label: 'English',
                  subLabel: 'إنجليزي',
                  isSelected: selectedLanguage == 'en',
                  onTap: () => onLanguageChanged('en'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _LanguageOption(
                  label: 'العربية',
                  subLabel: 'Arabic',
                  isSelected: selectedLanguage == 'ar',
                  onTap: () => onLanguageChanged('ar'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LanguageOption extends StatefulWidget {
  final String label;
  final String subLabel;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.label,
    required this.subLabel,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_LanguageOption> createState() => _LanguageOptionState();
}

class _LanguageOptionState extends State<_LanguageOption>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 110));
    _scale = Tween<double>(begin: 1.0, end: 0.95)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _ctrl.forward(),
      onTapUp: (_) {
        _ctrl.reverse();
        widget.onTap();
      },
      onTapCancel: () => _ctrl.reverse(),
      child: ScaleTransition(
        scale: _scale,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? const Color(0xFFE8F6F8)
                : const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.isSelected
                  ? const Color(0xFF0B8A9A)
                  : const Color(0xFFE2E8F0),
              width: widget.isSelected ? 1.5 : 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                child: Icon(
                  Icons.language_rounded,
                  size: 26,
                  color: widget.isSelected
                      ? const Color(0xFF0B8A9A)
                      : const Color(0xFF8A94A6),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.label,
                style: GoogleFonts.cairo(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: widget.isSelected
                      ? const Color(0xFF0B8A9A)
                      : const Color(0xFF0F1E2E),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                widget.subLabel,
                style: GoogleFonts.cairo(
                  fontSize: 11,
                  color: widget.isSelected
                      ? const Color(0xFF0B8A9A).withOpacity(0.7)
                      : const Color(0xFF8A94A6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}