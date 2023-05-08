import 'package:animate_do/animate_do.dart';
import 'package:exercises_apps/features/tok_tik/domain/entities/video_post.dart';
import 'package:exercises_apps/features/tok_tik/shared/extensions/int_extensions.dart';
import 'package:flutter/material.dart';

class VideoButtons extends StatefulWidget {
  final VideoPost videoPost;
  final Function(VideoPost) handleLikeVideo;

  const VideoButtons(
      {super.key, required this.videoPost, required this.handleLikeVideo});

  @override
  State<VideoButtons> createState() => _VideoButtonsState();
}

class _VideoButtonsState extends State<VideoButtons> {
  late AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Column(
        children: [
          _CustomIconButton(
              icon: widget.videoPost.isLiked
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              count: widget.videoPost.likes,
              color: Colors.deepPurpleAccent,
              onPressed: () {
                // animationController.forward();
                widget.handleLikeVideo(widget.videoPost);
              }),
          const SizedBox(height: 20),
          _CustomIconButton(
              icon: Icons.remove_red_eye_outlined,
              count: widget.videoPost.views,
              onPressed: () {}),
          const SizedBox(height: 20),
          SpinPerfect(
            infinite: true,
            duration: const Duration(seconds: 5),
            child: _CustomIconButton(
                icon: Icons.play_circle_outline, onPressed: () {}),
          ),
        ],
      ),
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final IconData icon;
  final int? count;
  final Color color;
  final VoidCallback onPressed;

  const _CustomIconButton(
      {required this.icon,
      this.count,
      this.color = Colors.white,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: IconButton(
              key: ValueKey(icon),
              onPressed: onPressed, icon: Icon(icon, color: color, size: 30)),
        ),
        if (count != null) Text(count!.toHumanReadable())
      ],
    );
  }
}
