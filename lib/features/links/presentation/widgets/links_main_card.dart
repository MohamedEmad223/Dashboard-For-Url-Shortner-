import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/empty_states.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/link_row.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/links_filter_section.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/links_search_bar.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/links_table_header.dart';
import 'package:flutter/material.dart';
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F7FA),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '$filteredLinksCount من $totalLinks روابط',
                    style: GoogleFonts.cairo(
                      fontSize: 12,
                      color: const Color(0xFF8A94A6),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'جميع الروابط المختصرة',
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: const Color(0xFF0F1E2E),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F5F7),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Icon(
                    Icons.link_rounded,
                    size: 17,
                    color: Color(0xFF0B8A9A),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: Color(0xFFEDF0F4)),

          // Search bar
          AnimatedCard(
            delayMs: 180,
            child: LinksSearchBar(
              controller: searchController,
              onChanged: onSearchChanged,
            ),
          ),

          // Filter chips row
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

          // Table header
          const AnimatedCard(
            delayMs: 300,
            child: LinksTableHeader(),
          ),

          // Body
          Expanded(
            child: links.isEmpty
                ? const EmptyStates()
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 0, bottom: 16),
                    itemCount: links.length,
                    itemBuilder: (_, i) => LinkRow(
                      link: links[i],
                      isLast: i == links.length - 1,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

