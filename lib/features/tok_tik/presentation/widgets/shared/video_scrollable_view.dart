import 'package:exercises_apps/features/tok_tik/presentation/widgets/shared/video_buttons.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/video_post.dart';
import '../video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];
        return Stack(children: [
          SizedBox.expand(
              child: FullScreenPlayer(
                  caption: videoPost.caption, videoUrl: videoPost.imageUrl)),
          Positioned(
              bottom: 40, right: 20, child: VideoButtons(videoPost: videoPost))
        ]);
      },
    );
  }
}
