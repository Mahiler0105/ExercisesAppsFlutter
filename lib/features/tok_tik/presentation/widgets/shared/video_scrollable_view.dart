import 'package:exercises_apps/features/tok_tik/presentation/providers/tok_tik_provider.dart';
import 'package:exercises_apps/features/tok_tik/presentation/widgets/shared/video_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/entities/video_post.dart';
import '../video/fullscreen_player.dart';

class VideoScrollableView extends StatefulWidget {
  final List<VideoPost> videos;
  final Function(VideoPost) handleLikeVideo;

  const VideoScrollableView(
      {super.key, required this.videos, required this.handleLikeVideo});

  @override
  State<VideoScrollableView> createState() => _VideoScrollableViewState();
}

class _VideoScrollableViewState extends State<VideoScrollableView> {
  late int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TokTikProvider>();

    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: widget.videos.length,
      onPageChanged: (index) {
        final nextVideoPost = widget.videos[index];
        final actualVideoPost = widget.videos[currentIndex];
        final nextController = provider.videoPlayerControllers.firstWhere(
            (element) => element.dataSource == nextVideoPost.imageUrl);
        final actualController = provider.videoPlayerControllers.firstWhere(
            (element) => element.dataSource == actualVideoPost.imageUrl);
        actualController.setVolume(0);
        nextController.setVolume(50);
        currentIndex = index;
      },
      itemBuilder: (context, index) {
        final videoPost = widget.videos[index];
        return Stack(children: [
          SizedBox.expand(
              child: FullScreenPlayer(
                  caption: videoPost.caption,
                  videoUrl: videoPost.imageUrl,
                  onCreateController: provider.onCreateVideoPlayerController,
                  onDisposeController:
                      provider.onDisposeVideoPlayerController)),
          Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(
                  videoPost: videoPost,
                  handleLikeVideo: widget.handleLikeVideo))
        ]);
      },
    );
  }
}
