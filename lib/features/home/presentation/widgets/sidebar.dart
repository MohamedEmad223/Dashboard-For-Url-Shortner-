import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int selected = 0;
  int hovered = -1;

  final items = [
    {'icon': Icons.home_outlined, 'label': 'الرئيسية'},
    {'icon': Icons.link, 'label': 'الروابط'},
    {'icon': Icons.qr_code_2, 'label': 'رموز QR'},
    {'icon': Icons.bar_chart, 'label': 'الإحصائيات'},
    {'icon': Icons.campaign_outlined, 'label': 'الحملات'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 24),
          const Icon(Icons.ac_unit, size: 32, color: Color(0xFF0D7A8A)),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 16),
              label: Text('إنشاء رابط جديد',
                  style: GoogleFonts.cairo(fontSize: 13)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D7A8A),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 42),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Nav Items
          ...items.asMap().entries.map((e) {
            final i = e.key;
            final item = e.value;
            return _SidebarItem(
              icon: item['icon'] as IconData,
              label: item['label'] as String,
              isSelected: selected == i,
              onTap: () => setState(() => selected = i),
            );
          }),

          const Spacer(),

          _SidebarItem(
            icon: Icons.settings_outlined,
            label: 'الإعدادات',
            isSelected: false,
            onTap: () {},
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ─── Extracted item widget so each manages its own hover state cleanly ───────

class _SidebarItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<_SidebarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _hoverAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _hoverAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(_) => _controller.forward();
  void _onExit(_) => _controller.reverse();

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF0D7A8A);
    const gray = Color(0xFF6B7280);
    const lightGray = Color(0xFF9CA3AF);

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _hoverAnim,
          builder: (context, child) {
            final t = _hoverAnim.value;

            // Smoothly interpolate colors
            final bgColor = widget.isSelected
                ? const Color(0xFFE0F2F4)
                : Color.lerp(Colors.transparent, const Color(0xFFF0FAFB), t)!;

            final iconBgColor = widget.isSelected
                ? teal.withOpacity(0.12)
                : Color.lerp(Colors.transparent, teal.withOpacity(0.08), t)!;

            final iconColor = widget.isSelected
                ? teal
                : Color.lerp(lightGray, teal.withOpacity(0.85), t)!;

            final textColor = widget.isSelected
                ? teal
                : Color.lerp(gray, teal.withOpacity(0.85), t)!;

            final borderColor = widget.isSelected
                ? teal.withOpacity(0.3)
                : Colors.transparent;

            final shadowOpacity = 0.0;

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: borderColor, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: teal.withOpacity(shadowOpacity),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.label,
                    style: GoogleFonts.cairo(
                      fontSize: 14,
                      fontWeight: widget.isSelected || t > 0.5
                          ? FontWeight.w600
                          : FontWeight.normal,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: iconBgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(widget.icon, size: 18, color: iconColor),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}