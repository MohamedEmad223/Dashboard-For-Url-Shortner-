import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFilterChip extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final bool isOpen;
  final VoidCallback onTap;

  const CustomFilterChip({
    super.key,
    required this.label,
    required this.icon,
    required this.isActive,
    required this.isOpen,
    required this.onTap,
  });

  @override
  State<CustomFilterChip> createState() => _CustomFilterChipState();
}

class _CustomFilterChipState extends State<CustomFilterChip>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 110));
    _scale = Tween<double>(begin: 1.0, end: 0.94)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final active = widget.isActive || widget.isOpen;

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
          padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: active
                ? const Color(0xFFE0F5F7)
                : const Color(0xFFF4F7FA),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: active
                  ? const Color(0xFF0B8A9A).withOpacity(0.5)
                  : const Color(0xFFDDE3EC),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedRotation(
                turns: widget.isOpen ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 16.r,
                  color: active
                      ? const Color(0xFF0B8A9A)
                      : const Color(0xFF8A94A6),
                ),
              ),
               SizedBox(width: 6.w),
              Text(
                widget.label,
                style: GoogleFonts.cairo(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: active
                      ? const Color(0xFF0B8A9A)
                      : const Color(0xFF4A5568),
                ),
              ),
               SizedBox(width: 6.w),
              Icon(
                widget.icon,
                size: 14.r,
                color: active
                    ? const Color(0xFF0B8A9A)
                    : const Color(0xFF8A94A6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}