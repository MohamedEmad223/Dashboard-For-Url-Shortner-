import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkSelectorCard extends StatefulWidget {
  final bool isFromMyLinks;
  final String customUrl;
  final ValueChanged<bool> onModeChanged;
  final ValueChanged<String> onUrlChanged;

  const LinkSelectorCard({
    super.key,
    required this.isFromMyLinks,
    required this.customUrl,
    required this.onModeChanged,
    required this.onUrlChanged,
  });

  @override
  State<LinkSelectorCard> createState() => _LinkSelectorCardState();
}

class _LinkSelectorCardState extends State<LinkSelectorCard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.isFromMyLinks ? 0 : 1,
    );
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        widget.onModeChanged(_tabController.index == 0);
      }
    });
  }

  @override
  void didUpdateWidget(LinkSelectorCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    final targetIndex = widget.isFromMyLinks ? 0 : 1;
    if (_tabController.index != targetIndex) {
      _tabController.animateTo(targetIndex);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              Text('اختيار الرابط',
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
                child: const Icon(Icons.link_rounded,
                    size: 17, color: Color(0xFF0B8A9A)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // TabBar
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF4F7FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelColor: const Color(0xFF0B8A9A),
              unselectedLabelColor: const Color(0xFF8A94A6),
              labelStyle: GoogleFonts.cairo(
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: GoogleFonts.cairo(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              labelPadding: EdgeInsets.zero,
              padding: const EdgeInsets.all(4),
              tabs: const [
                Tab(text: 'من روابطي'),
                Tab(text: 'رابط مخصص'),
              ],
            ),
          ),
          const SizedBox(height: 14),
          // Sub label
          Text(
            widget.isFromMyLinks
                ? 'اختر رابط من روابطك المختصرة'
                : 'أدخل الرابط الذي تريد توليد QR له',
            textAlign: TextAlign.right,
            style: GoogleFonts.cairo(
                fontSize: 12, color: const Color(0xFF8A94A6)),
          ),
          const SizedBox(height: 10),
          // Input
          TextField(
            textAlign: TextAlign.right,
            style: GoogleFonts.cairo(fontSize: 14),
            onChanged: widget.onUrlChanged,
            decoration: InputDecoration(
              hintText: widget.isFromMyLinks ? '...اختر رابط' : 'https://...',
              hintStyle: GoogleFonts.cairo(
                  color: const Color(0xFFB0BAC9), fontSize: 13),
              suffixIcon: widget.isFromMyLinks
                  ? const Icon(Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFF8A94A6))
                  : null,
              filled: true,
              fillColor: const Color(0xFFF8FAFC),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFEDF0F4)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFEDF0F4)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Color(0xFF0B8A9A), width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
