import 'package:exercises_apps/features/yes_no_app/presentation/screens/yes_no_app_screen.dart';
import 'package:flutter/material.dart';
import '../main/main_screen.dart';

class MainRouter {
  static const String mainRoute = '/';
  static const String yesNoAppRoute = '/yes-no-app';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case yesNoAppRoute:
        return MaterialPageRoute(builder: (_) => const YesNoAppScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}
