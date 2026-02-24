import 'package:flutter/material.dart';

import 'create_link_bottom_sheet.dart';

class ShowCreateLinksSheet extends StatelessWidget {
  const ShowCreateLinksSheet({super.key});

  Future<void> showSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const CreateLinkSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showSheet(context);
    });
    return const SizedBox.shrink();
  }
}
