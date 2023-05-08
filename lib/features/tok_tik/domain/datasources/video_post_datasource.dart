import 'package:exercises_apps/features/tok_tik/domain/entities/video_post.dart';

abstract class VideoPostDataSource {
  Future<List<VideoPost>> getVideoPostsByPage(int page);
}
