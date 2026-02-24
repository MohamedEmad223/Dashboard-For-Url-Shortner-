import 'package:dashboard_for_url_shortner/config/router/routes.dart';
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
      default:
        return null;
    }
  }
}