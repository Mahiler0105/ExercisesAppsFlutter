import 'package:exercises_apps/features/tok_tik/infrastructure/extensions/local_video_model_extensions.dart';
import 'package:exercises_apps/features/tok_tik/shared/data/local_video_posts.dart';
import 'package:flutter/widgets.dart';
import '../../domain/entities/video_post.dart';
import '../../infrastructure/models/local_video_model.dart';

class TokTikProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    final newVideos = videoPosts.map((videoPost) => LocalVideoModel.fromJson(videoPost).toVideoPostEntity()).toList();
    videos.addAll(newVideos);

    initialLoading = false;
    notifyListeners();
  }
}
