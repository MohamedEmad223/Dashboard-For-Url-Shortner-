import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int selected = 0;

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
          // Logo
          const Icon(Icons.assignment_ind_outlined, size: 32, color: Color(0xFF0D7A8A)),
          const SizedBox(height: 24),
          // Create Button
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
            return ListTile(
              onTap: () => setState(() => selected = i),
              selected: selected == i,
              selectedTileColor: const Color(0xFFEFF6FF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              leading: Icon(item['icon'] as IconData,
                  size: 20,
                  color: selected == i
                      ? const Color(0xFF0D7A8A)
                      : const Color(0xFF6B7280)),
              title: Text(item['label'] as String,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.cairo(
                    fontSize: 14,
                    fontWeight: selected == i
                        ? FontWeight.w600
                        : FontWeight.normal,
                    color: selected == i
                        ? const Color(0xFF0D7A8A)
                        : const Color(0xFF6B7280),
                  )),
            );
          }),
          const Spacer(),
          // Settings
          ListTile(
            leading: const Icon(Icons.settings_outlined,
                size: 20, color: Color(0xFF6B7280)),
            title: Text('الإعدادات',
                textAlign: TextAlign.right,
                style: GoogleFonts.cairo(
                    fontSize: 14, color: const Color(0xFF6B7280))),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}