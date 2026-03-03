import 'package:dashboard_for_url_shortner/core/widgets/no_links_placeholder.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/cubit/over_view_cubit.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/over_view_body.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/quick_stats_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderForOverView extends StatelessWidget {
  const BlocBuilderForOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OverViewCubit, OverViewState>(
      buildWhen: (previous, current) =>
          current is OverViewLoading ||
          current is OverViewSuccess ||
          current is OverViewFailure,
      builder: (BuildContext context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (overViewData) =>
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OverViewBody(overViewResponseModel: overViewData),
                   SizedBox(height: 14.h),
                  QuickStatsCard(
                    overViewResponseModel: overViewData,
                  ),
                ],
              ),
          failure: (error) {
            if (error.statusCode == 404) {
              return const NoLinksPlaceholder(
                title: 'No links yet',
                subtitle: 'Create your first short link to see your dashboard overview',
              );
            }
            final isUnauthorized = error.statusCode == 401;
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isUnauthorized ? Icons.lock_outline_rounded : Icons.cloud_off_rounded,
                    size: 48.r,
                    color: Colors.grey,
                  ),
                   SizedBox(height: 12.h),
                  Text(
                    isUnauthorized
                        ? 'You are not authorized. Please log in again.'
                        : 'There is an error with the server, please try again',
                    textAlign: TextAlign.center,
                    style:  TextStyle(fontSize: 15.sp, color: Colors.grey),
                  ),
                   SizedBox(height: 12.h),
                  TextButton.icon(
                    onPressed: () => context.read<OverViewCubit>().overView(),
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('Try Again'),
                  ),
                ],
              ),
            );
          },


          initial: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
