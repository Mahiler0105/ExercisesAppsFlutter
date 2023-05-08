import 'package:animate_do/animate_do.dart';
import 'package:exercises_apps/features/tok_tik/presentation/widgets/video/video_background.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String caption;
  final String videoUrl;
  final Function(VideoPlayerController) onCreateController;
  final Function(VideoPlayerController) onDisposeController;

  const FullScreenPlayer(
      {super.key,
      required this.caption,
      required this.videoUrl,
      required this.onCreateController,
      required this.onDisposeController});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late Future<void> _initializeVideoPlayerFuture;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..setLooping(true)
      ..setVolume(0)
      ..play();
    widget.onCreateController(_videoPlayerController);
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    widget.onDisposeController(_videoPlayerController);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          return GestureDetector(
            onTap: () => _videoPlayerController.value.isPlaying
                ? _videoPlayerController.pause()
                : _videoPlayerController.play(),
            child: AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(_videoPlayerController),
                    VideoBackground(stops: const [0.7, 1.0]),
                    Positioned(
                        bottom: 100,
                        left: 20,
                        child: _VideoCaption(caption: widget.caption))
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
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return FadeInDown(
        child: SizedBox(
            width: size.width * 0.6,
            child: Text(caption, maxLines: 2, style: titleStyle)));
  }
}
