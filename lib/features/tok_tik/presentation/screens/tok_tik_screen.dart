import 'package:exercises_apps/features/tok_tik/presentation/providers/tok_tik_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/shared/video_scrollable_view.dart';

class TokTikScreen extends StatelessWidget {
  const TokTikScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tokTikProvider = context.watch<TokTikProvider>();

    return Scaffold(
      body: tokTikProvider.initialLoading
          ? const CircularProgressIndicator()
          : VideoScrollableView(
              videos: tokTikProvider.videos,
              handleLikeVideo: tokTikProvider.likeTheVideo),
    );
  }
}
