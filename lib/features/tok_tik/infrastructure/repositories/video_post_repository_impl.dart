import 'package:exercises_apps/features/tok_tik/domain/datasources/video_post_datasource.dart';
import 'package:exercises_apps/features/tok_tik/domain/entities/video_post.dart';
import 'package:exercises_apps/features/tok_tik/domain/repositories/video_post_repository.dart';

class VideoPostRepositoryImpl implements VideoPostRepository{
  final VideoPostDataSource videoPostDataSource;

  VideoPostRepositoryImpl({required this.videoPostDataSource});

  @override
  Future<List<VideoPost>> getVideoPostByPage(int page) {
    return videoPostDataSource.getVideoPostsByPage(page);
  }
}
