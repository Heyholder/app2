class CommentModel {
  final int id;
  final int postId;
  final int parentCommentId;
  final int commentWriterId;
  final String commentContent;
  final String userName;
  final int holdCount;
  final String createdAt;

  CommentModel(
      {required this.id,
      required this.postId,
      required this.parentCommentId,
      required this.commentWriterId,
      required this.commentContent,
      required this.userName,
      required this.holdCount,
      required this.createdAt});

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
      id: int.parse(json['cmt_no']),
      postId: int.parse(json['pst_no']),
      parentCommentId: int.parse(json["upper_cmt_no"]),
      commentWriterId: int.parse(json["ins_id"]),
      commentContent: json['comment_text'],
      userName: json['write_nm'],
      holdCount: json['onsk_tisu_cnt'],
      createdAt: json['reg_date']);
}
