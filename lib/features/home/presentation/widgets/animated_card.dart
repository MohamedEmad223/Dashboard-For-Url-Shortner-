import 'package:flutter/material.dart';

class AnimatedCard extends StatefulWidget {
  final Widget child;
  final int delayMs;

  const AnimatedCard({super.key, required this.child, this.delayMs = 0});

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 520),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0, 1, curve: Curves.easeOut),
      ),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.18),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0, 1, curve: Curves.easeOutCubic),
      ),
    );

    _startAnimation();
  }

  void _startAnimation() {
    if (widget.delayMs == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _ctrl.forward();
      });
    } else {
      Future.delayed(Duration(milliseconds: widget.delayMs)).then((_) {
        if (!mounted) return;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _ctrl.forward();
        });
      });
    }
  }

  @override
  void dispose() {
    _ctrl.stop();
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: _opacity,
    child: SlideTransition(position: _slide, child: widget.child),
  );
}