import 'package:flutter/material.dart';
import 'custom_drob_down_menu.dart';

class DropdownOverlayContent extends StatelessWidget {
  final LayerLink link;
  final List<String> items;
  final String selected;
  final ValueChanged<String> onSelect;

  const DropdownOverlayContent({
    super.key,
    required this.link,
    required this.items,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: 180,
      child: CompositedTransformFollower(
        link: link,
        showWhenUnlinked: false,
        offset: const Offset(0, 48),
        child: Material(
          color: Colors.transparent,
          child: CustomDrobDownMenu(
            items: items,
            selected: selected,
            onSelect: onSelect,
          ),
        ),
      ),
    );
  }
}