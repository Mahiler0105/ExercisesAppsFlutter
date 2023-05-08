import 'package:exercises_apps/features/tok_tik/domain/entities/video_post.dart';
import 'package:exercises_apps/features/tok_tik/infrastructure/models/local_video_model.dart';

extension LocalVideoModelExtensions on LocalVideoModel {
  VideoPost toVideoPostEntity(){
    return VideoPost(caption: name, imageUrl: videoUrl, likes: likes, views:  views, isLiked: false);
  }
}
