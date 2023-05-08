import 'package:exercises_apps/features/tok_tik/domain/entities/video_post.dart';

abstract class VideoPostRepository {
  Future<List<VideoPost>> getVideoPostByPage(int page);
}
