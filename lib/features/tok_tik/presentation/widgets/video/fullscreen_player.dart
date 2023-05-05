import 'package:exercises_apps/features/tok_tik/presentation/widgets/video/video_background.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String caption;
  final String videoUrl;

  const FullScreenPlayer(
      {super.key, required this.caption, required this.videoUrl});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: videoPlayerController.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          return GestureDetector(
            onTap: () => videoPlayerController.value.isPlaying ? videoPlayerController.pause() : videoPlayerController.play(),
            child: AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(videoPlayerController),
                    VideoBackground(stops: const [0.7, 1.0]),
                    Positioned(bottom: 50, left: 20, child: _VideoCaption(caption: widget.caption))
                  ],
                )),
          );
        });
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(width: size.width * 0.6, child: Text(caption, maxLines: 2, style: titleStyle));
  }

}
