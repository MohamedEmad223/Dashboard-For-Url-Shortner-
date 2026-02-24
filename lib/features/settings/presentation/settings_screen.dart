import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/settings/widgets/app_info_card.dart';
import 'package:dashboard_for_url_shortner/features/settings/widgets/language_selector_card.dart';
import 'package:dashboard_for_url_shortner/features/settings/widgets/save_settings_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'ar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Top Bar ───────────────────────────────────────
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    children: [
                      // Notification bell
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(Icons.notifications_none_rounded,
                            color: Color(0xFF4A5568), size: 22),
                      ),
                      const Spacer(),
                      // Title
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'الإعدادات',
                            style: GoogleFonts.cairo(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF0F1E2E),
                            ),
                          ),
                          Text(
                            'قم بتخصيص تفضيلاتك',
                            style: GoogleFonts.cairo(
                              fontSize: 12,
                              color: const Color(0xFF8A94A6),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      // Avatar
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF0B8A9A), Color(0xFF13C5D8)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'ج',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Language Card ─────────────────────────────────
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 100,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                  child: LanguageSelectorCard(
                    selectedLanguage: _selectedLanguage,
                    onLanguageChanged: (lang) {
                      setState(() => _selectedLanguage = lang);
                    },
                  ),
                ),
              ),
            ),

            // ── App Info Card ─────────────────────────────────
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 200,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: AppInfoCard(),
                ),
              ),
            ),

            // ── Save Button ───────────────────────────────────
            SliverToBoxAdapter(
              child: AnimatedCard(
                delayMs: 300,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
                  child: SaveSettingsButton(
                    onTap: () {
                      // TODO: implement save logic
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}