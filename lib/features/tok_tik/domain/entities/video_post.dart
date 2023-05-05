class VideoPost {
  final String caption;
  final String imageUrl;
  final int likes;
  final int views;

  VideoPost({
    required this.caption,
    required this.imageUrl,
    this.likes = 0,
    this.views = 0});
}
