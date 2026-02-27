import 'package:dashboard_for_url_shortner/features/home/presentation/cubit/over_view_cubit.dart';
import 'package:dashboard_for_url_shortner/features/home/presentation/widgets/over_view_body.dart';
import 'package:flutter/material.dart';
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
              OverViewBody(overViewResponseModel: overViewData),
          failure: (errorMessage) => Center(child: Text(errorMessage.message)),
          initial: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
