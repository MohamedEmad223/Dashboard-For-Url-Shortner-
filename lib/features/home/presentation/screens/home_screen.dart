import 'package:dashboard_for_url_shortner/core/dependancy_injection/di.dart';
import 'package:dashboard_for_url_shortner/core/widgets/main_header_of_pagesa_widgets.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/cubit/over_view_cubit.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/bloc_builder_for_over_view.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/lable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/header_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OverViewCubit>()..overView(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F7FA),
        body: SafeArea(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: RefreshIndicator(
              color: const Color(0xFF0B8A9A),
              backgroundColor: Colors.white,
              onRefresh: ()async{
                return await context.read<OverViewCubit>().overView();
              },
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  MainHeaderOfPagesWidgets(
                    title: 'Dashboard',
                    subtitle: 'hello again, ',
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        HeaderBanner(),
                        const SizedBox(height: 20),
                        LableTextWidget(title: 'Overview'),
                        BlocBuilderForOverView(),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
