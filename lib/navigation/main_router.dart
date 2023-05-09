import 'package:exercises_apps/features/widgets_app/presentation/screens/button/buttons_screen.dart';
import 'package:exercises_apps/features/widgets_app/presentation/screens/card/cards_screen.dart';
import 'package:exercises_apps/features/widgets_app/presentation/screens/home/widget_summary_home_screen.dart';
import 'package:exercises_apps/features/widgets_app/presentation/screens/progress/progress_screen.dart';
import 'package:exercises_apps/features/yes_no_app/presentation/screens/yes_no_app_screen.dart';
import 'package:go_router/go_router.dart';
import '../features/tok_tik/presentation/screens/tok_tik_screen.dart';
import '../main/main_screen.dart';

final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(name: MainScreen.name, path: "/", builder: (context, state) => const MainScreen()),
      GoRoute(name: YesNoAppScreen.name,  path: "/yes-no-app", builder: (context, state) => const YesNoAppScreen()),
      GoRoute(name: TokTikScreen.name,  path: "/tok-tik-app", builder: (context, state) => const TokTikScreen()),
      GoRoute(name: WidgetSummaryHomeScreen.name,  path: "/widget-summary", builder: (context, state) => const WidgetSummaryHomeScreen()),
      GoRoute(name: ButtonsScreen.name,  path: "/widget-summary/buttons", builder: (context, state) => const ButtonsScreen()),
      GoRoute(name: CardsScreen.name,  path: "/widget-summary/cards", builder: (context, state) => const CardsScreen()),
      GoRoute(name: ProgressScreen.name,  path: "/widget-summary/progress-bar", builder: (context, state) => const ProgressScreen()),
    ]
);

