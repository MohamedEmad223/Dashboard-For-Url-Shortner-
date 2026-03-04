import 'package:dashboard_for_url_shortner/core/dependancy_injection/di.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/cubit/links_cubit.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/screens/links_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LinksScreen extends StatelessWidget {
  const LinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LinksCubit>(),
      child:  LinksScreenView(),
    );
  }
}

