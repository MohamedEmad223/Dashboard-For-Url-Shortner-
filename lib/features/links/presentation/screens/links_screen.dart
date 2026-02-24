import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/animated_fab.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/create_link_bottom_sheet.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/custom_drob_down_menu.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/empty_states.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/filterd_chip.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/header_cell.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/widgets/link_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class LinksScreen extends StatefulWidget {
  const LinksScreen({super.key});

  @override
  State<LinksScreen> createState() => _LinksScreenState();
}

class _LinksScreenState extends State<LinksScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  String _selectedCampaign = 'جميع الحملات';
  String _selectedStatus = 'جميع الحالات';
  bool _showCampaignDropdown = false;
  bool _showStatusDropdown = false;
  final LayerLink _campaignLink = LayerLink();
  final LayerLink _statusLink = LayerLink();
  OverlayEntry? _campaignOverlay;
  OverlayEntry? _statusOverlay;

  final _campaigns = ['جميع الحملات', 'بدون حملة'];
  final _statuses = ['جميع الحالات', 'نشط', 'متوقف'];

  final List<Map<String, dynamic>> _links = [];

  @override
  void dispose() {
    _searchCtrl.dispose();
    _removeCampaignOverlay();
    _removeStatusOverlay();
    super.dispose();
  }

  void _removeCampaignOverlay() {
    _campaignOverlay?.remove();
    _campaignOverlay = null;
  }

  void _removeStatusOverlay() {
    _statusOverlay?.remove();
    _statusOverlay = null;
  }

  void _toggleCampaignDropdown(BuildContext ctx) {
    if (_campaignOverlay != null) {
      _removeCampaignOverlay();
      setState(() => _showCampaignDropdown = false);
      return;
    }
    _removeStatusOverlay();
    setState(() {
      _showCampaignDropdown = true;
      _showStatusDropdown = false;
    });
    _campaignOverlay = _buildOverlay(
      context: ctx,
      link: _campaignLink,
      items: _campaigns,
      selected: _selectedCampaign,
      onSelect: (v) {
        setState(() => _selectedCampaign = v);
        _removeCampaignOverlay();
        setState(() => _showCampaignDropdown = false);
      },
    );
    Overlay.of(ctx).insert(_campaignOverlay!);
  }

  void _toggleStatusDropdown(BuildContext ctx) {
    if (_statusOverlay != null) {
      _removeStatusOverlay();
      setState(() => _showStatusDropdown = false);
      return;
    }
    _removeCampaignOverlay();
    setState(() {
      _showStatusDropdown = true;
      _showCampaignDropdown = false;
    });
    _statusOverlay = _buildOverlay(
      context: ctx,
      link: _statusLink,
      items: _statuses,
      selected: _selectedStatus,
      onSelect: (v) {
        setState(() => _selectedStatus = v);
        _removeStatusOverlay();
        setState(() => _showStatusDropdown = false);
      },
    );
    Overlay.of(ctx).insert(_statusOverlay!);
  }

  OverlayEntry _buildOverlay({
    required BuildContext context,
    required LayerLink link,
    required List<String> items,
    required String selected,
    required ValueChanged<String> onSelect,
  }) {
    return OverlayEntry(
      builder: (_) => Positioned(
        width: 180,
        child: CompositedTransformFollower(
          link: link,
          showWhenUnlinked: false,
          offset: const Offset(0, 48),
          child: Material(
            color: Colors.transparent,
            child: CustomDrobDownMenu(
              items: items,
              onSelect: onSelect,
              selected: selected,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _removeCampaignOverlay();
        _removeStatusOverlay();
        setState(() {
          _showCampaignDropdown = false;
          _showStatusDropdown = false;
        });
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F7FA),
        body: SafeArea(
          child: Column(
            children: [
              // ── Top Bar ──────────────────────────────────────
              AnimatedCard(
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
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(Icons.notifications_none_rounded,
                            color: Color(0xFF4A5568), size: 22),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('الروابط المختصرة',
                              style: GoogleFonts.cairo(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF0F1E2E),
                              )),
                          Text('إدارة ومتابعة جميع روابطك',
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

              const SizedBox(height: 16),

              // ── Main Card ────────────────────────────────────
              Expanded(
                child: AnimatedCard(
                  delayMs: 100,
                  child: Container(
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
                          padding:
                          const EdgeInsets.fromLTRB(16, 18, 16, 12),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF4F7FA),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '0 من 0 روابط',
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
                                child: const Icon(Icons.link_rounded,
                                    size: 17, color: Color(0xFF0B8A9A)),
                              ),
                            ],
                          ),
                        ),

                        const Divider(
                            height: 1, color: Color(0xFFEDF0F4)),

                        // Search bar
                        AnimatedCard(
                          delayMs: 180,
                          child: Padding(
                            padding:
                            const EdgeInsets.fromLTRB(16, 14, 16, 0),
                            child: TextField(
                              controller: _searchCtrl,
                              textAlign: TextAlign.right,
                              style: GoogleFonts.cairo(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: 'البحث عن رابط...',
                                hintStyle: GoogleFonts.cairo(
                                    color: const Color(0xFFB0BAC9),
                                    fontSize: 13),
                                prefixIcon: const Icon(
                                    Icons.search_rounded,
                                    color: Color(0xFFB0BAC9),
                                    size: 20),
                                filled: true,
                                fillColor: const Color(0xFFF8FAFC),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFEDF0F4)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFEDF0F4)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF0B8A9A), width: 1.5),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Filter chips row
                        AnimatedCard(
                          delayMs: 240,
                          child: Padding(
                            padding:
                            const EdgeInsets.fromLTRB(16, 12, 16, 0),
                            child: Row(
                              children: [
                                CompositedTransformTarget(
                                  link: _statusLink,
                                  child: CustomFilterChip(
                                    label: _selectedStatus,
                                    icon: Icons.filter_list_rounded,
                                    isActive:
                                    _selectedStatus != 'جميع الحالات',
                                    isOpen: _showStatusDropdown,
                                    onTap: () =>
                                        _toggleStatusDropdown(context),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                CompositedTransformTarget(
                                  link: _campaignLink,
                                  child: CustomFilterChip(
                                    label: _selectedCampaign,
                                    icon: Icons.campaign_outlined,
                                    isActive: _selectedCampaign !=
                                        'جميع الحملات',
                                    isOpen: _showCampaignDropdown,
                                    onTap: () =>
                                        _toggleCampaignDropdown(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Table header
                        AnimatedCard(
                          delayMs: 300,
                          child: Container(
                            margin:
                            const EdgeInsets.fromLTRB(16, 14, 16, 0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                HeaderCell('الإجراءات', flex: 2),
                                HeaderCell('الحالة', flex: 2),
                                HeaderCell('الزيارات', flex: 2),
                                HeaderCell('الرابط المختصر', flex: 3),
                              ],
                            ),
                          ),
                        ),

                        // Body
                        Expanded(
                          child: _links.isEmpty
                              ? EmptyStates()
                              : ListView.builder(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 16),
                            itemCount: _links.length,
                            itemBuilder: (_, i) =>
                                LinkRow(link: _links[i]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
        floatingActionButton: AnimatedFab(
          onTap: () => _showCreateLinkSheet(context),
        ),
      ),
    );
  }

  void _showCreateLinkSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const CreateLinkSheet(),
    );
  }
}






