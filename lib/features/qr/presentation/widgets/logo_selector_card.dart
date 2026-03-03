import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoSelectorCard extends StatelessWidget {
  final bool withLogo;
  final ValueChanged<bool> onChanged;

  const LogoSelectorCard({
    super.key,
    required this.withLogo,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12.r,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:  EdgeInsets.all(7.r),
                decoration: BoxDecoration(
                    color: const Color(0xFFE6FAF4),
                    borderRadius: BorderRadius.circular(9.r)),
                child:  Icon(Icons.image_outlined,
                    size: 17.r, color: Color(0xFF059669)),
              ),
               SizedBox(width: 8.w),
              Text('Jo Academy Logo',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      color: const Color(0xFF0F1E2E))),
            ],
          ),
           SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _LogoOption(
                  label: 'Without Logo',
                  icon: Icons.hide_image_outlined,
                  isSelected: !withLogo,
                  onTap: () => onChanged(false),
                ),
              ),
               SizedBox(width: 12.w),
              Expanded(
                child: _LogoOption(
                  label: 'With Logo',
                  icon: Icons.add_photo_alternate_outlined,
                  isSelected: withLogo,
                  onTap: () => onChanged(true),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LogoOption extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _LogoOption(
      {required this.label,
        required this.icon,
        required this.isSelected,
        required this.onTap});

  @override
  State<_LogoOption> createState() => _LogoOptionState();
}

class _LogoOptionState extends State<_LogoOption>
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
          padding:  EdgeInsets.symmetric(vertical: 16.h),
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
                  size: 28.r,
                  color: widget.isSelected
                      ? const Color(0xFF0B8A9A)
                      : const Color(0xFF8A94A6)),
               SizedBox(height: 8.h),
              Text(widget.label,
                  style: GoogleFonts.cairo(
                      fontSize: 13.sp,
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