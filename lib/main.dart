import 'package:exercises_apps/features/tok_tik/infrastructure/datasources/local_video_post_datasource.dart';
import 'package:exercises_apps/features/tok_tik/presentation/providers/tok_tik_provider.dart';
import 'package:exercises_apps/navigation/main_router.dart';
import 'package:exercises_apps/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/tok_tik/infrastructure/repositories/video_post_repository_impl.dart';
import 'features/yes_no_app/presentation/providers/chat_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostRepositoryImpl(
        videoPostDataSource: LocalVideoPostDataSource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(
            lazy: false,
            create: (_) => TokTikProvider(videoPostRepository)..loadNextPage()),
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
