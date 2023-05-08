class VideoPost {
  final String caption;
  final String imageUrl;
  final int likes;
  final int views;
  bool isLiked;

  VideoPost({
    required this.caption,
    required this.imageUrl,
    required this.isLiked,
    this.likes = 0,
    this.views = 0});
}
