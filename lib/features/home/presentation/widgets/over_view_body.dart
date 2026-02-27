import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/stat_card.dart' show StatCard;
import 'package:flutter/material.dart';

class OverViewBody extends StatelessWidget {
  const OverViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedCard(
          delayMs: 150,
          child: Row(
            children: [
              StatCard(
                title: 'Monthly Growth',
                value: '18%+',
                change: '3%',
                color: const Color(0xFFF97316),
                lightColor: const Color(0xFFFFF0E6),
                icon: Icons.trending_up_rounded,
              ),
              const SizedBox(width: 12),
              StatCard(
                title: 'All Time Clicks',
                value: '0',
                change: '8%',
                color: const Color(0xFF7C3AED),
                lightColor: const Color(0xFFF3EEFF),
                icon: Icons.ads_click_rounded,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        AnimatedCard(
          delayMs: 250,
          child: Row(
            children: [
              StatCard(
                title: 'All Views',
                value: '0',
                change: '12%',
                color: const Color(0xFF059669),
                lightColor: const Color(0xFFE6FAF4),
                icon: Icons.remove_red_eye_outlined,
              ),
              const SizedBox(width: 12),
              StatCard(
                title: 'All Links',
                value: '0',
                change: '5%',
                color: const Color(0xFF2563EB),
                lightColor: const Color(0xFFEBF2FF),
                icon: Icons.link_rounded,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
