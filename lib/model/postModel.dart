import 'dart:convert';

/// post_title : "안녕하시오"
/// reg_date : "2022.07.23"
/// onsk_tisu_cnt : 4000
/// view_cnt : 0
/// pst_no : "90"
/// write_nm : "댓글 테스트"
/// post_text : "반갑소\n\n"
/// like_cnt : 0
/// comment_cnt : 0

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    String? postTitle,
    String? regDate,
    int? holdCount,
    int? viewCount,
    String? postNo,
    String? writeName,
    String? postContent,
    int? likeCount,
    int? commentCount,
  }) {
    _postTitle = postTitle;
    _regDate = regDate;
    _holdCount = holdCount;
    _viewCount = viewCount;
    _postNo = postNo;
    _writeName = writeName;
    _postContent = postContent;
    _likeCount = likeCount;
    _commentCount = commentCount;
  }

  PostModel.fromJson(dynamic json) {
    _postTitle = json['post_title'];
    _regDate = json['reg_date'];
    _holdCount = json['onsk_tisu_cnt'];
    _viewCount = json['view_cnt'];
    _postNo = json['pst_no'];
    _writeName = json['write_nm'];
    _postContent = json['post_text'];
    _likeCount = json['like_cnt'];
    _commentCount = json['comment_cnt'];
  }

  String? _postTitle;
  String? _regDate;
  int? _holdCount;
  int? _viewCount;
  String? _postNo;
  String? _writeName;
  String? _postContent;
  int? _likeCount;
  int? _commentCount;

  PostModel copyWith({
    String? postTitle,
    String? regDate,
    int? holdCount,
    int? viewCount,
    String? postNo,
    String? writeName,
    String? postContent,
    int? likeCount,
    int? commentCount,
  }) =>
      PostModel(
        postTitle: postTitle ?? _postTitle,
        regDate: regDate ?? _regDate,
        holdCount: holdCount ?? _holdCount,
        viewCount: viewCount ?? _viewCount,
        postNo: postNo ?? _postNo,
        writeName: writeName ?? _writeName,
        postContent: postContent ?? _postContent,
        likeCount: likeCount ?? _likeCount,
        commentCount: commentCount ?? _commentCount,
      );

  String? get postTitle => _postTitle;

  String? get regDate => _regDate;

  int? get holdCount => _holdCount;

  int? get viewCount => _viewCount;

  String? get postNo => _postNo;

  String? get writeName => _writeName;

  String? get postContent => _postContent;

  int? get likeCount => _likeCount;

  int? get commentCount => _commentCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['post_title'] = _postTitle;
    map['reg_date'] = _regDate;
    map['onsk_tisu_cnt'] = _holdCount;
    map['view_cnt'] = _viewCount;
    map['pst_no'] = _postNo;
    map['write_nm'] = _writeName;
    map['post_text'] = _postContent;
    map['like_cnt'] = _likeCount;
    map['comment_cnt'] = _commentCount;
    return map;
  }
}
