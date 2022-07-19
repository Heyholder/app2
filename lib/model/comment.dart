class CommentModel {
  final int id;
  final String commentContent;
  final String userName;
  final int holdCount;
  final String createdAt;

  CommentModel(
      {required this.id,
      required this.commentContent,
      required this.userName,
      required this.holdCount,
      required this.createdAt});

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
      id: int.parse(json['comment_no']),
      commentContent: json['commentContent'],
      userName: 'userName',
      holdCount: json['holdCount'],
      createdAt: 'createdAt');
}
