import 'package:flutter/material.dart';

class ResendCodeButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;

  const ResendCodeButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isLoading
                ? [
                    const Color(0xFF076475).withValues(alpha: 0.6),
                    const Color(0xFF13C5D8).withValues(alpha: 0.6)
                  ]
                : [const Color(0xFF076475), const Color(0xFF13C5D8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0B8A9A).withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoading)
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            else
              const Icon(
                Icons.refresh_rounded,
                size: 20,
                color: Colors.white,
              ),
            const SizedBox(width: 8),
            Text(
              isLoading ? 'Sending...' : 'Resend Code',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

