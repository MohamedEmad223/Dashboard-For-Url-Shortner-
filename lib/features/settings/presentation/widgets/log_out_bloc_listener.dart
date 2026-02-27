import 'package:dashboard_for_url_shortner/config/cache/cache_helper.dart';
import 'package:dashboard_for_url_shortner/config/router/routes.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_constants.dart';
import 'package:dashboard_for_url_shortner/features/settings/presentation/cubit/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogOutBlocListener extends StatelessWidget {
  final Widget child;

  const LogOutBlocListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listenWhen: (previous, current) =>
      current is LogOutLoading ||
          current is LogOutSuccess ||
          current is LogOutFailure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) =>
              const Center(child: CircularProgressIndicator()),
            );
          },
          success: (data) async {
            Navigator.of(context, rootNavigator: true).pop();
            await CacheHelper.deleteSecureData(
              key: ApiConstants.accessToken,
            );

            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.loginScreen,
                  (route) => false,
            );

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(data.message),
                backgroundColor: Colors.green,
              ),
            );
          },
          failure: (errorMessage) {
            Navigator.of(context, rootNavigator: true).pop();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage.message),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      child: child,
    );
  }
}