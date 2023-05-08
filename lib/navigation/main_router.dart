import 'package:exercises_apps/features/widgets_app/presentation/screens/home/widget_summary_home_screen.dart';
import 'package:exercises_apps/features/yes_no_app/presentation/screens/yes_no_app_screen.dart';
import 'package:go_router/go_router.dart';
import '../features/tok_tik/presentation/screens/tok_tik_screen.dart';
import '../main/main_screen.dart';

final router = GoRouter(
    initialLocation: MainScreen.name,
    routes: [
      GoRoute(name: MainScreen.name, path: "/", builder: (context, state) => const MainScreen()),
      GoRoute(name: YesNoAppScreen.name,  path: "/yes-no-app", builder: (context, state) => const YesNoAppScreen()),
      GoRoute(name: TokTikScreen.name,  path: "/tok-tik-app", builder: (context, state) => const TokTikScreen()),
      GoRoute(name: WidgetSummaryHomeScreen.name,  path: "/widget-summary", builder: (context, state) => const WidgetSummaryHomeScreen()),
    ]
);

