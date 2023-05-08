import 'package:exercises_apps/features/tok_tik/domain/repositories/video_post_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import '../../domain/entities/video_post.dart';

class TokTikProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];
  List<VideoPlayerController> videoPlayerControllers = [];

  final VideoPostRepository videoPostRepository;

  TokTikProvider(this.videoPostRepository);

  Future<void> loadNextPage() async {
    final newVideos = await videoPostRepository.getVideoPostByPage(1);
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }

  likeTheVideo(VideoPost videoPost) {
    var index = videos.indexOf(videoPost);
    videos[index].isLiked = !videos[index].isLiked;
    notifyListeners();
  }

  onCreateVideoPlayerController(VideoPlayerController controller){
    if(videoPlayerControllers.isEmpty){
      controller.setVolume(50);
    }
    videoPlayerControllers.add(controller);
  }

  onDisposeVideoPlayerController(VideoPlayerController controller){
    final index = videoPlayerControllers.indexOf(controller);
    videoPlayerControllers.removeAt(index);
  }
}
