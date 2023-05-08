import 'package:exercises_apps/features/tok_tik/domain/datasources/video_post_datasource.dart';
import 'package:exercises_apps/features/tok_tik/domain/entities/video_post.dart';
import 'package:exercises_apps/features/tok_tik/infrastructure/extensions/local_video_model_extensions.dart';
import 'package:exercises_apps/features/tok_tik/shared/data/local_video_posts.dart';
import '../models/local_video_model.dart';

class LocalVideoPostDataSource implements VideoPostDataSource{
  @override
  Future<List<VideoPost>> getVideoPostsByPage(int page) {
    return Future.value(videoPosts.map((videoPost) => LocalVideoModel.fromJson(videoPost).toVideoPostEntity()).toList());
  }
}
