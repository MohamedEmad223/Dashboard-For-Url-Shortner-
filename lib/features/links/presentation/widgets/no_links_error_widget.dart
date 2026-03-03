import 'package:dashboard_for_url_shortner/features/links/presentation/cubit/links_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/no_links_placeholder.dart';
import 'create_link_bottom_sheet.dart';

class NoLinksErrorWidget extends StatelessWidget {
  const NoLinksErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NoLinksPlaceholder(
        title: 'No links yet',
        subtitle: 'Create your first short link to get started',
        onCreateLink: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => CreateLinkBottomSheet(
              onCreateLink: (originalUrl, customAlias, title) {
                context.read<LinksCubit>().createLink(
                  originalUrl: originalUrl,
                  customAlias: customAlias,
                  title: title,
                );
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}
