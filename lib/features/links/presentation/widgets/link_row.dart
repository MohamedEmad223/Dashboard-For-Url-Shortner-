import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkRow extends StatelessWidget {
  final Map<String, dynamic> link;
  final bool isLast;

  const LinkRow({
    super.key,
    required this.link,
    this.isLast = false,
  });

  Widget _buildFixedCell(Widget child, double width, {bool isLast = false}) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          right: isLast
              ? BorderSide.none
              : const BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
      ),
      child: child,
    );
  }

  String _getStatusText(dynamic status) {
    if (status == null) return 'غير نشط';

    final statusStr = status.toString().toLowerCase();
    if (statusStr == 'active' || statusStr == 'نشط' || status == true) {
      return 'نشط';
    } else if (statusStr == 'expired' || statusStr == 'منتهي') {
      return 'منتهي';
    } else {
      return 'غير نشط';
    }
  }

  Color _getStatusBackgroundColor(dynamic status) {
    if (status == null) return const Color(0xFFFFF0E6);

    final statusStr = status.toString().toLowerCase();
    if (statusStr == 'active' || statusStr == 'نشط' || status == true) {
      return const Color(0xFFE6FAF4); // Green background for active
    } else if (statusStr == 'expired' || statusStr == 'منتهي') {
      return const Color(0xFFFEE2E2); // Red background for expired
    } else {
      return const Color(0xFFFFF0E6); // Orange background for inactive
    }
  }

  Color _getStatusTextColor(dynamic status) {
    if (status == null) return const Color(0xFFF97316);

    final statusStr = status.toString().toLowerCase();
    if (statusStr == 'active' || statusStr == 'نشط' || status == true) {
      return const Color(0xFF059669); // Green text for active
    } else if (statusStr == 'expired' || statusStr == 'منتهي') {
      return const Color(0xFFDC2626); // Red text for expired
    } else {
      return const Color(0xFFF97316); // Orange text for inactive
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isLast
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              )
            : null,
        border: const Border(
          left: BorderSide(color: Color(0xFFE2E8F0), width: 1),
          right: BorderSide(color: Color(0xFFE2E8F0), width: 1),
          bottom: BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Actions column
            _buildFixedCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomActionButton(
                      icon: Icons.edit_outlined,
                      color: const Color(0xFF0B8A9A)),
                  const SizedBox(width: 8),
                  CustomActionButton(
                      icon: Icons.delete_outline_rounded,
                      color: const Color(0xFFE53E3E)),
                ],
              ),
              120,
            ),

            // Status column
            _buildFixedCell(
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusBackgroundColor(link['status']),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    _getStatusText(link['status']),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: _getStatusTextColor(link['status']),
                    ),
                  ),
                ),
              ),
              100,
            ),

            // Visits column
            _buildFixedCell(
              Center(
                child: Text(
                  '${link['visits'] ?? 0}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0F1E2E)),
                ),
              ),
              100,
            ),

            // Original URL column
            _buildFixedCell(
              Center(
                child: Text(
                  link['original'] ?? '',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF64748B),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              250,
            ),

            // Short URL column
            _buildFixedCell(
              Center(
                child: Text(
                  link['short'] ?? '',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0B8A9A),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              200,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}