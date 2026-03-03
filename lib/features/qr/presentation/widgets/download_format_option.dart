import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadFormatOption extends StatefulWidget {
  final String label;
  final String sub;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const DownloadFormatOption(
      {required this.label,
        required this.sub,
        required this.icon,
        required this.isSelected,
        required this.onTap});

  @override
  State<DownloadFormatOption> createState() => _DownloadFormatOptionState();
}

class _DownloadFormatOptionState extends State<DownloadFormatOption>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
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
          padding:  EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? const Color(0xFFE8F6F8)
                : const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(12.r),
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
                  size: 22.r,
                  color: widget.isSelected
                      ? const Color(0xFF0B8A9A)
                      : const Color(0xFF8A94A6)),
               SizedBox(height: 6.h),
              Text(widget.label,
                  style: GoogleFonts.robotoMono(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: widget.isSelected
                          ? const Color(0xFF0B8A9A)
                          : const Color(0xFF0F1E2E))),
               SizedBox(height: 2.h),
              Text(widget.sub,
                  style: GoogleFonts.cairo(
                      fontSize: 10.sp,
                      color: widget.isSelected
                          ? const Color(0xFF0B8A9A).withOpacity(0.7)
                          : const Color(0xFF8A94A6))),
            ],
          ),
        ),
      ),
    );
  }
}