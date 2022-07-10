import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

class Post {
  final int id;
  final String postTitle;
  final String postContent;
  final String userName;
  final String createdAt;
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

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: int.parse(json['pst_no']),
      postTitle: json['post_title'],
      postContent: json['post_text'],
      userName: json['write_nm'],
      createdAt: json['reg_date'],
      likeCount: json['like_cnt'],
      commentCount: json['comment_cnt'] ?? 0,
      viewCount: json['view_cnt']);
}
