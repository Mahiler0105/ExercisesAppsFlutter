import 'package:animate_do/animate_do.dart';
import 'package:exercises_apps/features/tok_tik/domain/entities/video_post.dart';
import 'package:exercises_apps/features/tok_tik/shared/extensions/int_extensions.dart';
import 'package:flutter/material.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost videoPost;

  const VideoButtons({super.key, required this.videoPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
            icon: Icons.favorite, count: videoPost.likes, color: Colors.red),
        const SizedBox(height: 20),
        _CustomIconButton(
            icon: Icons.remove_red_eye_outlined, count: videoPost.views),
        const SizedBox(height: 20),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(
              icon: Icons.play_circle_outline),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final IconData icon;
  final int? count;
  final Color color;

  const _CustomIconButton(
      {required this.icon, this.count, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () {}, icon: Icon(icon, color: color, size: 30)),
        if(count != null) Text(count!.toHumanReadable())
      ],
    );
  }
}
