import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateRangeChip extends StatefulWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  static const List<String> ranges = [
    'آخر 7 أيام',
    'آخر 30 يوم',
    'آخر 90 يوم',
    'كل الأوقات',
  ];

  const DateRangeChip({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  State<DateRangeChip> createState() => _DateRangeChipState();
}

class _DateRangeChipState extends State<DateRangeChip> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  void _toggleDropdown() {
    if (_isOpen) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    _overlayEntry = _buildOverlay();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isOpen = true);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (mounted) setState(() => _isOpen = false);
  }

  OverlayEntry _buildOverlay() {
    return OverlayEntry(
      builder: (_) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _removeOverlay,
        child: Stack(
          children: [
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: const Offset(0, 46),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: DateRangeChip.ranges.map((range) {
                        final isSelected = range == widget.selected;
                        return InkWell(
                          onTap: () {
                            widget.onChanged(range);
                            _removeOverlay();
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 11),
                            color: isSelected
                                ? const Color(0xFFE8F6F8)
                                : Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (isSelected)
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Icon(Icons.check_rounded,
                                        size: 16,
                                        color: Color(0xFF0B8A9A)),
                                  ),
                                const Spacer(),
                                Text(
                                  range,
                                  style: GoogleFonts.cairo(
                                    fontSize: 13,
                                    fontWeight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w500,
                                    color: isSelected
                                        ? const Color(0xFF0B8A9A)
                                        : const Color(0xFF4A5568),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _isOpen ? const Color(0xFFE8F6F8) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _isOpen
                  ? const Color(0xFF0B8A9A)
                  : const Color(0xFFDDE3EC),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedRotation(
                turns: _isOpen ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 16,
                  color: _isOpen
                      ? const Color(0xFF0B8A9A)
                      : const Color(0xFF8A94A6),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                widget.selected,
                style: GoogleFonts.cairo(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _isOpen
                      ? const Color(0xFF0B8A9A)
                      : const Color(0xFF4A5568),
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                Icons.calendar_today_outlined,
                size: 14,
                color: _isOpen
                    ? const Color(0xFF0B8A9A)
                    : const Color(0xFF8A94A6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}