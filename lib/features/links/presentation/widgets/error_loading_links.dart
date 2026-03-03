import 'package:dashboard_for_url_shortner/features/links/presentation/cubit/links_cubit.dart';
import 'package:dashboard_for_url_shortner/features/links/presentation/cubit/links_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorLoadingLinks extends StatelessWidget {
  const ErrorLoadingLinks({super.key, required this.state});
  final LinksState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 60.r,
              color: Colors.red,
            ),
            SizedBox(height: 16.h),
            Text(
              'Error Loading Links',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 32.w),
              child: Text(
                state.error!.message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                context.read<LinksCubit>().clearError();
                context.read<LinksCubit>().getLinks();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
