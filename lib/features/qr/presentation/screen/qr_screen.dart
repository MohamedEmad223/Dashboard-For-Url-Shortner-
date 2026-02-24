import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/color_customzation_card.dart';
import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/download_format_card.dart';
import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/link_selector_card.dart';
import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/logo_selector_card.dart';
import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/qr_preview_card.dart';
import 'package:dashboard_for_url_shortner/features/qr/presentation/widgets/qr_style_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  bool _isFromMyLinks = true;
  String _url = '';
  Color _qrColor = const Color(0xFF0F3D5C);
  Color _bgColor = Colors.white;
  QrStyle _qrStyle = QrStyle.square;
  bool _withLogo = true;
  DownloadFormat _downloadFormat = DownloadFormat.png;

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
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 8),
                          ],
                        ),
                        child: const Icon(Icons.notifications_none_rounded,
                            color: Color(0xFF4A5568), size: 22),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('توليد رموز QR',
                              style: GoogleFonts.cairo(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF0F1E2E),
                              )),
                          Text('قم بتخصيص وتحميل QR Code',
                              style: GoogleFonts.cairo(
                                fontSize: 12,
                                color: const Color(0xFF8A94A6),
                              )),
                        ],
                      ),
                      const SizedBox(width: 12),
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
                          child: Text('ج',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // ── Link Selector ─────────────────────────
                  AnimatedCard(
                    delayMs: 80,
                    child: LinkSelectorCard(
                      isFromMyLinks: _isFromMyLinks,
                      customUrl: _url,
                      onModeChanged: (v) =>
                          setState(() => _isFromMyLinks = v),
                      onUrlChanged: (v) => setState(() => _url = v),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // ── QR Preview ─────────────────────────────
                  AnimatedCard(
                    delayMs: 160,
                    child: QrPreviewCard(
                      hasUrl: _url.isNotEmpty,
                      url: _url,
                      qrColor: _qrColor,
                      bgColor: _bgColor,
                      isRounded: _qrStyle == QrStyle.rounded,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // ── Color Customization ────────────────────]
                  AnimatedCard(
                    delayMs: 240,
                    child: ColorCustomizationCard(
                      qrColor: _qrColor,
                      bgColor: _bgColor,
                      onQrColorChanged: (c) =>
                          setState(() => _qrColor = c),
                      onBgColorChanged: (c) =>
                          setState(() => _bgColor = c),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // ── QR Style ───────────────────────────────
                  AnimatedCard(
                    delayMs: 320,
                    child: QrStyleCard(
                      selectedStyle: _qrStyle,
                      onStyleChanged: (s) =>
                          setState(() => _qrStyle = s),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // ── Logo Selector ──────────────────────────
                  AnimatedCard(
                    delayMs: 400,
                    child: LogoSelectorCard(
                      withLogo: _withLogo,
                      onChanged: (v) => setState(() => _withLogo = v),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // ── Download Format ────────────────────────
                  AnimatedCard(
                    delayMs: 480,
                    child: DownloadFormatCard(
                      selectedFormat: _downloadFormat,
                      onFormatChanged: (f) =>
                          setState(() => _downloadFormat = f),
                    ),
                  ),
                  const SizedBox(height: 24),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}