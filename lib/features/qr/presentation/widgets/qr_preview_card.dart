import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gal/gal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPreviewCard extends StatefulWidget {
  final bool hasUrl;
  final String url;
  final Color qrColor;
  final Color bgColor;
  final bool isRounded;

  const QrPreviewCard({
    super.key,
    required this.hasUrl,
    this.url = '',
    required this.qrColor,
    required this.bgColor,
    this.isRounded = false,
  });

  @override
  State<QrPreviewCard> createState() => _QrPreviewCardState();
}

class _QrPreviewCardState extends State<QrPreviewCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _btnCtrl;
  late Animation<double> _btnScale;
  final GlobalKey _qrKey = GlobalKey();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _btnCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 110));
    _btnScale = Tween<double>(begin: 1.0, end: 0.95)
        .animate(CurvedAnimation(parent: _btnCtrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _btnCtrl.dispose();
    super.dispose();
  }

  Future<void> _saveQrImage() async {
    if (!widget.hasUrl || _isSaving) return;

    setState(() => _isSaving = true);

    try {
      final boundary =
      _qrKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;

      if (boundary == null) {
        _showSnackBar('خطأ في التقاط الصورة', isError: true);
        return;
      }

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) {
        _showSnackBar('فشل في تحويل الصورة', isError: true);
        return;
      }

      final Uint8List pngBytes = byteData.buffer.asUint8List();

      // ✅ حفظ باستخدام gal

      await Gal.putImageBytes(
        pngBytes,
        name: 'QR_${DateTime.now().millisecondsSinceEpoch}',
      );

      if (mounted) {
        _showSnackBar('تم حفظ QR Code بنجاح ✓');
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar('حدث خطأ أثناء الحفظ', isError: true);
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: GoogleFonts.cairo(fontWeight: FontWeight.w600),
        ),
        backgroundColor:
            isError ? const Color(0xFFE53E3E) : const Color(0xFF0B8A9A),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

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
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('معاينة QR Code',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: const Color(0xFF0F1E2E))),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: const Color(0xFFE0F5F7),
                    borderRadius: BorderRadius.circular(9)),
                child: const Icon(Icons.qr_code_2_rounded,
                    size: 17, color: Color(0xFF0B8A9A)),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // QR Preview box
          Center(
            child: RepaintBoundary(
              key: _qrKey,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: widget.bgColor,
                  borderRadius: BorderRadius.circular(16),
                  border:
                      Border.all(color: const Color(0xFFEDF0F4), width: 1),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 2))
                  ],
                ),
                child:
                    widget.hasUrl ? _buildQrCode() : _buildPlaceholder(),
              ),
            ),
          ),
          const SizedBox(height: 18),

          // Download button
          GestureDetector(
            onTapDown: (_) {
              if (widget.hasUrl) _btnCtrl.forward();
            },
            onTapUp: (_) {
              _btnCtrl.reverse();
              if (widget.hasUrl) {
                _saveQrImage();
              } else {
                _showSnackBar('يرجى إدخال رابط أولاً', isError: true);
              }
            },
            onTapCancel: () => _btnCtrl.reverse(),
            child: ScaleTransition(
              scale: _btnScale,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  gradient: widget.hasUrl
                      ? const LinearGradient(
                          colors: [Color(0xFF076475), Color(0xFF13C5D8)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: widget.hasUrl ? null : const Color(0xFFEDF0F4),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xFF0B8A9A)
                            .withOpacity(widget.hasUrl ? 0.3 : 0.0),
                        blurRadius: 10,
                        offset: const Offset(0, 4))
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_isSaving)
                      const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    else
                      Icon(Icons.file_download_outlined,
                          color: widget.hasUrl
                              ? Colors.white
                              : const Color(0xFFB0BAC9),
                          size: 18),
                    const SizedBox(width: 8),
                    Text(
                      _isSaving ? 'جاري الحفظ...' : 'تحميل QR Code',
                      style: GoogleFonts.cairo(
                        color: widget.hasUrl
                            ? Colors.white
                            : const Color(0xFFB0BAC9),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.qr_code_2_rounded,
            size: 52, color: const Color(0xFFDDE3EC)),
        const SizedBox(height: 8),
        Text(
          'أدخل رابطاً لتوليد\nرمز QR',
          textAlign: TextAlign.center,
          style: GoogleFonts.cairo(
              fontSize: 12, color: const Color(0xFFB0BAC9), height: 1.5),
        ),
      ],
    );
  }

  Widget _buildQrCode() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: QrImageView(
        data: widget.url,
        version: QrVersions.auto,
        backgroundColor: widget.bgColor,
        eyeStyle: QrEyeStyle(
          eyeShape:
              widget.isRounded ? QrEyeShape.circle : QrEyeShape.square,
          color: widget.qrColor,
        ),
        dataModuleStyle: QrDataModuleStyle(
          dataModuleShape: widget.isRounded
              ? QrDataModuleShape.circle
              : QrDataModuleShape.square,
          color: widget.qrColor,
        ),
        gapless: true,
        errorStateBuilder: (cxt, err) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline,
                    size: 36, color: Colors.red),
                const SizedBox(height: 6),
                Text(
                  'رابط غير صالح',
                  style: GoogleFonts.cairo(
                      fontSize: 11, color: const Color(0xFFE53E3E)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

