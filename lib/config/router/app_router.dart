import 'package:dashboard_for_url_shortner/config/router/routes.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:dashboard_for_url_shortner/features/auth/forget_password/presentation/screens/verify_code_screen.dart';
import 'package:dashboard_for_url_shortner/features/auth/signup/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../../features/auth/login/presentation/screens/login_screen.dart';


class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
        case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
        case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );
        case Routes.verifyCodeScreen:
        return MaterialPageRoute(
          builder: (_) =>  VerifyCodeScreen(),
        );
      default:
        return null;
    }
  }
}