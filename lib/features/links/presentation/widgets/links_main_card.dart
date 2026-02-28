import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/custom_action_button.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/empty_states.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/links_filter_section.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/links_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LinksMainCard extends StatelessWidget {
  final TextEditingController searchController;
  final LayerLink campaignLink;
  final LayerLink statusLink;
  final String selectedCampaign;
  final String selectedStatus;
  final bool showCampaignDropdown;
  final bool showStatusDropdown;
  final VoidCallback onCampaignTap;
  final VoidCallback onStatusTap;
  final List<Map<String, dynamic>> links;
  final int totalLinks;
  final int filteredLinksCount;
  final ValueChanged<String>? onSearchChanged;
  final Function(int)? onDeleteLink;
  final Function(int)? onToggleLinkStatus;

  const LinksMainCard({
    super.key,
    required this.searchController,
    required this.campaignLink,
    required this.statusLink,
    required this.selectedCampaign,
    required this.selectedStatus,
    required this.showCampaignDropdown,
    required this.showStatusDropdown,
    required this.onCampaignTap,
    required this.onStatusTap,
    required this.links,
    required this.totalLinks,
    required this.filteredLinksCount,
    this.onSearchChanged,
    this.onDeleteLink,
    this.onToggleLinkStatus,
  });

  Widget _headerCell(String text) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.cairo(
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF475569),
        ),
      ),
    );
  }

  Widget _dataCell(Widget child) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
      child: child,
    );
  }

  String _statusLabel(dynamic status) {
    final s = status?.toString().toLowerCase() ?? '';
    if (s == 'active' || status == true) return 'Active';
    if (s == 'expired') return 'Expired';
    return 'Inactive';
  }

  Color _statusBg(dynamic status) {
    final s = status?.toString().toLowerCase() ?? '';
    if (s == 'active' || status == true) return const Color(0xFFE6FAF4);
    if (s == 'expired') return const Color(0xFFFEE2E2);
    return const Color(0xFFFFF0E6);
  }

  Color _statusFg(dynamic status) {
    final s = status?.toString().toLowerCase() ?? '';
    if (s == 'active' || status == true) return const Color(0xFF059669);
    if (s == 'expired') return const Color(0xFFDC2626);
    return const Color(0xFFF97316);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 16.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header row
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
            child: Row(
              children: [
                Container(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F7FA),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    '$filteredLinksCount of $totalLinks links',
                    style: GoogleFonts.cairo(
                      fontSize: 12.sp,
                      color: const Color(0xFF8A94A6),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'All Short Links',
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                    color: const Color(0xFF0F1E2E),
                  ),
                ),
                 SizedBox(width: 8.w),
                Container(
                  padding:  EdgeInsets.all(7.r),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F5F7),
                    borderRadius: BorderRadius.circular(9.r),
                  ),
                  child:  Icon(
                    Icons.link_rounded,
                    size: 17.r,
                    color: Color(0xFF0B8A9A),
                  ),
                ),
              ],
            ),
          ),
           Divider(height: 1.h, color: Color(0xFFEDF0F4)),
          AnimatedCard(
            delayMs: 180,
            child: LinksSearchBar(
              controller: searchController,
              onChanged: onSearchChanged,
            ),
          ),
          AnimatedCard(
            delayMs: 240,
            child: LinksFilterSection(
              campaignLink: campaignLink,
              statusLink: statusLink,
              selectedCampaign: selectedCampaign,
              selectedStatus: selectedStatus,
              showCampaignDropdown: showCampaignDropdown,
              showStatusDropdown: showStatusDropdown,
              onCampaignTap: onCampaignTap,
              onStatusTap: onStatusTap,
            ),
          ),
           SizedBox(height: 14.h),
          Expanded(
            child: links.isEmpty
                ? const EmptyStates()
                : Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: SingleChildScrollView(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Table(
                            defaultColumnWidth: const IntrinsicColumnWidth(),
                            columnWidths: const {
                              0: FixedColumnWidth(200), // Short URL
                              1: FixedColumnWidth(250), // Original URL
                              2: FixedColumnWidth(100), // Visits
                              3: FixedColumnWidth(100), // Status
                              4: FixedColumnWidth(120), // Actions
                            },
                            border: TableBorder.all(
                              color: const Color(0xFFE2E8F0),
                              width: 1.w,
                            ),
                            children: [
                              TableRow(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF8FAFC),
                                ),
                                children: [
                                  _headerCell('Short URL'),
                                  _headerCell('Original URL'),
                                  _headerCell('Visits'),
                                  _headerCell('Status'),
                                  _headerCell('Actions'),
                                ],
                              ),
                              ...links.map(
                                (link) => TableRow(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  children: [
                                    // Short URL
                                    _dataCell(
                                      Text(
                                        link['short'] ?? '',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: GoogleFonts.cairo(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xFF0B8A9A),
                                        ),
                                      ),
                                    ),
                                    _dataCell(
                                      Text(
                                        link['original'] ?? '',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: GoogleFonts.cairo(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF64748B),
                                        ),
                                      ),
                                    ),
                                    // Visits
                                    _dataCell(
                                      Text(
                                        '${link['visits'] ?? 0}',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.cairo(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF0F1E2E),
                                        ),
                                      ),
                                    ),
                                    // Status badge
                                    _dataCell(
                                      Center(
                                        child: Container(
                                          padding:  EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 4.h),
                                          decoration: BoxDecoration(
                                            color: _statusBg(link['status']),
                                            borderRadius:
                                                BorderRadius.circular(6.r),
                                          ),
                                          child: Text(
                                            _statusLabel(link['status']),
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.cairo(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  _statusFg(link['status']),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Actions
                                    _dataCell(
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: () => onToggleLinkStatus?.call(link['id']),
                                            child: CustomActionButton(
                                              icon: Icons.edit_outlined,
                                              color: const Color(0xFF0B8A9A),
                                            ),
                                          ),
                                           SizedBox(width: 8.w),
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                  title: const Text('Delete Link'),
                                                  content: const Text('Are you sure you want to delete this link?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () => Navigator.pop(ctx),
                                                      child: const Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        onDeleteLink?.call(link['id']);
                                                        Navigator.pop(ctx);
                                                      },
                                                      child: const Text('Delete', style: TextStyle(color: Colors.red)),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            child: CustomActionButton(
                                              icon: Icons.delete_outline_rounded,
                                              color: const Color(0xFFE53E3E),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

