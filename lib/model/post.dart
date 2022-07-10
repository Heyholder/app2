class Post {
  final int id;
  final String postTitle;
  final String postContent;
  final String userName;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int likeCount;
  final int commentCount;
  final int viewCount;

  Post(
      {required this.id,
      required this.postTitle,
      required this.postContent,
      required this.userName,
      required this.createdAt,
      this.updatedAt,
      required this.likeCount,
      required this.commentCount,
      required this.viewCount});
}
