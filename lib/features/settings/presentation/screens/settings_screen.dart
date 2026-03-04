
import 'package:dashboard_for_url_shortner/config/cache/cache_helper.dart';
import 'package:dashboard_for_url_shortner/config/router/routes.dart';
import 'package:dashboard_for_url_shortner/core/dependancy_injection/di.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_constants.dart';
import 'package:dashboard_for_url_shortner/core/widgets/main_header_of_pagesa_widgets.dart';
import 'package:dashboard_for_url_shortner/features/auth/login/presentation/widgets/sign_in_button.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/animated_card.dart' show AnimatedCard;
import 'package:dashboard_for_url_shortner/features/settings/data/model/log_out_model_request.dart' show LogOutModelRequest;
import 'package:dashboard_for_url_shortner/features/settings/presentation/cubit/logout_cubit.dart';
import 'package:dashboard_for_url_shortner/features/settings/presentation/widgets/app_info_card.dart';
import 'package:dashboard_for_url_shortner/features/settings/presentation/widgets/log_out_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LogoutCubit>(),
      child: Builder(
        builder: (context) {
          return LogOutBlocListener(
            child: Scaffold(
              backgroundColor: const Color(0xFFF4F7FA),
              body: SafeArea(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    MainHeaderOfPagesWidgets(
                      title: 'Settings',
                      subtitle: 'Make your settings here',
                    ),
                    SliverToBoxAdapter(
                      child: AnimatedCard(
                        delayMs: 200,
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: AppInfoCard(),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: AnimatedCard(
                        delayMs: 300,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
                          child: CustomButton(
                            text: 'Log Out',
                            onTap: () async {
                              final cubit = context.read<LogoutCubit>();
                              final navigator = Navigator.of(context);

                              final token = await CacheHelper.getSecureData(
                                key: ApiConstants.accessToken,
                              );

                              CacheHelper.delete(key: ApiConstants.name);

                              if (token == null) {
                                navigator.pushNamedAndRemoveUntil(
                                  Routes.loginScreen,
                                      (route) => false,
                                );
                                return;
                              }
                              

                              cubit.logout(
                                LogOutModelRequest(token: token),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}