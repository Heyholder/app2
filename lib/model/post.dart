class PostModel {
  final int id;
  final String postTitle;
  final String postContent;
  final String userName;
  final int holdCount;
  final String createdAt;
  final DateTime? updatedAt;
  final int likeCount;
  final int commentCount;
  final int viewCount;

  PostModel({
    required this.id,
    required this.postTitle,
    required this.postContent,
    required this.userName,
    required this.createdAt,
    required this.holdCount,
    this.updatedAt,
    required this.likeCount,
    required this.commentCount,
    required this.viewCount,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
      id: int.parse(json['pst_no']),
      postTitle: json['post_title'],
      postContent: json['post_text'],
      userName: json['write_nm'],
      holdCount: json['onsk_tisu_cnt'],
      createdAt: json['reg_date'],
      likeCount: json['like_cnt'],
      commentCount: json['comment_cnt'],
      viewCount: json['view_cnt']);
}
