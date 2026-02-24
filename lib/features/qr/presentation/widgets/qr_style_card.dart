import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum QrStyle { rounded, square }

class QrStyleCard extends StatelessWidget {
  final QrStyle selectedStyle;
  final ValueChanged<QrStyle> onStyleChanged;

  const QrStyleCard({
    super.key,
    required this.selectedStyle,
    required this.onStyleChanged,
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
              offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('أسلوب QR Code',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: const Color(0xFF0F1E2E))),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: const Color(0xFFEBF2FF),
                    borderRadius: BorderRadius.circular(9)),
                child: const Icon(Icons.style_outlined,
                    size: 17, color: Color(0xFF2563EB)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _StyleOption(
                  label: 'مستدير',
                  icon: Icons.circle_outlined,
                  isSelected: selectedStyle == QrStyle.rounded,
                  onTap: () => onStyleChanged(QrStyle.rounded),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StyleOption(
                  label: 'مربعات',
                  icon: Icons.crop_square_rounded,
                  isSelected: selectedStyle == QrStyle.square,
                  onTap: () => onStyleChanged(QrStyle.square),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StyleOption extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _StyleOption(
      {required this.label,
        required this.icon,
        required this.isSelected,
        required this.onTap});

  @override
  State<_StyleOption> createState() => _StyleOptionState();
}

class _StyleOptionState extends State<_StyleOption>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
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
          duration: const Duration(milliseconds: 200),
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
            children: [
              Icon(widget.icon,
                  size: 28,
                  color: widget.isSelected
                      ? const Color(0xFF0B8A9A)
                      : const Color(0xFF8A94A6)),
              const SizedBox(height: 8),
              Text(widget.label,
                  style: GoogleFonts.cairo(
                      fontSize: 13,
                      fontWeight: widget.isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: widget.isSelected
                          ? const Color(0xFF0B8A9A)
                          : const Color(0xFF4A5568))),
            ],
          ),
        ),
      ),
    );
  }
}