import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/cubit/links_cubit.dart';

import 'create_link_bottom_sheet.dart';

class ShowCreateLinksSheet extends StatelessWidget {
  const ShowCreateLinksSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateLinkBottomSheet(
      onCreateLink: (originalUrl, customAlias, title) {
        context.read<LinksCubit>().createLink(
          originalUrl: originalUrl,
          customAlias: customAlias,
          title: title,
        );
        Navigator.pop(context);
      },
    );
  }
}
