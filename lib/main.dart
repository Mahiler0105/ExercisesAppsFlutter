import 'package:exercises_apps/navigation/main_router.dart';
import 'package:exercises_apps/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/yes_no_app/presentation/providers/chat_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        onGenerateRoute: MainRouter.generateRoute,
        initialRoute: MainRouter.mainRoute,
        title: 'Exercises App',
        theme: AppTheme(selectedColor: 1).theme(),
      ),
    );
  }
}
