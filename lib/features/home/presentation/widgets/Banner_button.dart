import 'package:dashboard_for_url_shortner/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool filled;
  final VoidCallback onTap;

  const BannerButton({super.key,
    required this.label,
    required this.icon,
    required this.filled,
    required this.onTap,
  });

  @override
  State<BannerButton> createState() => _BannerButtonState();
}

class _BannerButtonState extends State<BannerButton>
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
    return GestureDetector(
      onTapDown: (_) => _ctrl.forward(),
      onTapUp: (_) {
        _ctrl.reverse();
        widget.onTap();
      },
      onTapCancel: () => _ctrl.reverse(),
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          padding:
           EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: widget.filled
                ? Colors.white
                : Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12.r),
            border: widget.filled
                ? null
                : Border.all(
                color: Colors.white.withOpacity(0.4), width: 1.w),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 16.r,
                color: widget.filled
                    ? AppColors.teal
                    : Colors.white,
              ),
               SizedBox(width: 6.w),
              Text(
                widget.label,
                style: GoogleFonts.cairo(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: widget.filled ? AppColors.teal : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}