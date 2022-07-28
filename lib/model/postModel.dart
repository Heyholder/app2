import 'dart:convert';

/// post_title : "안녕하시오"
/// onsk_tisu_cnt : 4000
/// view_cnt : 17
/// stock_name : "테스트 종목"
/// pst_no : "90"
/// write_nm : "댓글 테스트"
/// post_text : "반갑소\n\n"
/// comment_cnt : 0
/// report_yn : "N"
/// reg_date : "2022.07.23"
/// post_text_json : "[{\"insert\":\"반갑소\\n\\n\"}]"
/// like_yn : "N"
/// ins_id : "1"
/// like_cnt : 0

PostModel postModelFromJson(String str) =>
    PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    String? postTitle,
    int? holdCount,
    int? viewCount,
    String? stockName,
    String? postNo,
    String? writerName,
    String? postContent,
    int? commentCount,
    String? reportYn,
    String? regDate,
    String? postContentJson,
    String? likeYn,
    String? insId,
    int? likeCount,
  }) {
    _postTitle = postTitle;
    _holdCount = holdCount;
    _viewCount = viewCount;
    _stockName = stockName;
    _postNo = postNo;
    _writerName = writerName;
    _postContent = postContent;
    _commentCount = commentCount;
    _reportYn = reportYn;
    _regDate = regDate;
    _postContentJson = postContentJson;
    _likeYn = likeYn;
    _insId = insId;
    _likeCount = likeCount;
  }

  PostModel.fromJson(dynamic json) {
    _postTitle = json['post_title'];
    _holdCount = json['onsk_tisu_cnt'];
    _viewCount = json['view_cnt'];
    _stockName = json['stock_name'];
    _postNo = json['pst_no'];
    _writerName = json['write_nm'];
    _postContent = json['post_text'];
    _commentCount = json['comment_cnt'];
    _reportYn = json['report_yn'];
    _regDate = json['reg_date'];
    _postContentJson = json['post_text_json'];
    _likeYn = json['like_yn'];
    _insId = json['ins_id'];
    _likeCount = json['like_cnt'];
  }

  String? _postTitle;
  int? _holdCount;
  int? _viewCount;
  String? _stockName;
  String? _postNo;
  String? _writerName;
  String? _postContent;
  int? _commentCount;
  String? _reportYn;
  String? _regDate;
  String? _postContentJson;
  String? _likeYn;
  String? _insId;
  int? _likeCount;

  PostModel copyWith({
    String? postTitle,
    int? holdCount,
    int? viewCount,
    String? stockName,
    String? postNo,
    String? writerName,
    String? postContent,
    int? commentCount,
    String? reportYn,
    String? regDate,
    String? postContentJson,
    String? likeYn,
    String? insId,
    int? likeCount,
  }) =>
      PostModel(
        postTitle: postTitle ?? _postTitle,
        holdCount: holdCount ?? _holdCount,
        viewCount: viewCount ?? _viewCount,
        stockName: stockName ?? _stockName,
        postNo: postNo ?? _postNo,
        writerName: writerName ?? _writerName,
        postContent: postContent ?? _postContent,
        commentCount: commentCount ?? _commentCount,
        reportYn: reportYn ?? _reportYn,
        regDate: regDate ?? _regDate,
        postContentJson: postContentJson ?? _postContentJson,
        likeYn: likeYn ?? _likeYn,
        insId: insId ?? _insId,
        likeCount: likeCount ?? _likeCount,
      );

  String? get postTitle => _postTitle;

  int? get holdCount => _holdCount;

  int? get viewCount => _viewCount;

  String? get stockName => _stockName;

  String? get postNo => _postNo;

  String? get writerName => _writerName;

  String? get postContent => _postContent;

  int? get commentCount => _commentCount;

  String? get reportYn => _reportYn;

  String? get regDate => _regDate;

  String? get postContentJson => _postContentJson;

  String? get likeYn => _likeYn;

  String? get insId => _insId;

  int? get likeCount => _likeCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['post_title'] = _postTitle;
    map['onsk_tisu_cnt'] = _holdCount;
    map['view_cnt'] = _viewCount;
    map['stock_name'] = _stockName;
    map['pst_no'] = _postNo;
    map['write_nm'] = _writerName;
    map['post_text'] = _postContent;
    map['comment_cnt'] = _commentCount;
    map['report_yn'] = _reportYn;
    map['reg_date'] = _regDate;
    map['post_text_json'] = _postContentJson;
    map['like_yn'] = _likeYn;
    map['ins_id'] = _insId;
    map['like_cnt'] = _likeCount;
    return map;
  }
}
