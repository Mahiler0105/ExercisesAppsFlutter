import 'package:exercises_apps/features/tok_tik/infrastructure/datasources/local_video_post_datasource.dart';
import 'package:exercises_apps/features/tok_tik/presentation/providers/tok_tik_provider.dart';
import 'package:exercises_apps/features/widgets_app/presentation/providers/theme_provider.dart';
import 'package:exercises_apps/navigation/main_router.dart';
import 'package:exercises_apps/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope, ConsumerWidget;
import 'package:provider/provider.dart';
import 'features/tok_tik/infrastructure/repositories/video_post_repository_impl.dart';
import 'features/yes_no_app/presentation/providers/chat_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final appTheme = ref.watch(themeNotifierProvider);

    final videoPostRepository = VideoPostRepositoryImpl(
        videoPostDataSource: LocalVideoPostDataSource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(
            lazy: false,
            create: (_) => TokTikProvider(videoPostRepository)..loadNextPage()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Exercises App',
        theme: appTheme.theme(),
      ),
    );
  }
}
