import 'dart:convert';

/// report_yn : "N"
/// reg_date : "2022.07.20"
/// comment_text : "저의 경우 현재 대주주가 지분도 없고 돈도 없는상태라 처분없이 이번 결의에 응하게 되었습니다 승산이 있는 게임이니까요\n주가 저평가에 대한 책임까지 물려야 되지 않을까요? 개인투자관련 해서 제가 관여할바는 아니지만.. 실적이나 전력반도체 관련 사업까지 절대 망할 회사는 아니라서 나무에 물주듯이 매수할 생각입니다 지금은 쭉정이 잡초제거 한다는 마음으로 임하구요"
/// path : [64]
/// onsk_tisu_cnt : 6000
/// cmt_no : "64"
/// level : 0
/// pst_no : "89"
/// upper_cmt_no : "0"
/// ins_id : "1"
/// write_nm : "댓글 테스트"

CommentModel commentModelFromJson(String str) =>
    CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  CommentModel({
    String? reportYn,
    String? regDate,
    String? commentContent,
    List<int>? path,
    int? holdCount,
    String? commentNo,
    int? level,
    String? postNo,
    String? parentCommentNo,
    String? insId,
    String? writerName,
  }) {
    _reportYn = reportYn;
    _regDate = regDate;
    _commentContent = commentContent;
    _path = path;
    _holdCount = holdCount;
    _commentNo = commentNo;
    _level = level;
    _postNo = postNo;
    _parentCommentNo = parentCommentNo;
    _insId = insId;
    _writerName = writerName;
  }

  CommentModel.fromJson(dynamic json) {
    _reportYn = json['report_yn'];
    _regDate = json['reg_date'];
    _commentContent = json['comment_text'];
    _path = json['path'] != null ? json['path'].cast<int>() : [];
    _holdCount = json['onsk_tisu_cnt'];
    _commentNo = json['cmt_no'];
    _level = json['level'];
    _postNo = json['pst_no'];
    _parentCommentNo = json['upper_cmt_no'];
    _insId = json['ins_id'];
    _writerName = json['write_nm'];
  }

  String? _reportYn;
  String? _regDate;
  String? _commentContent;
  List<int>? _path;
  int? _holdCount;
  String? _commentNo;
  int? _level;
  String? _postNo;
  String? _parentCommentNo;
  String? _insId;
  String? _writerName;

  CommentModel copyWith({
    String? reportYn,
    String? regDate,
    String? commentComment,
    List<int>? path,
    int? holdCount,
    String? commentNo,
    int? level,
    String? postNo,
    String? parentCommentNo,
    String? insId,
    String? writerName,
  }) =>
      CommentModel(
        reportYn: reportYn ?? _reportYn,
        regDate: regDate ?? _regDate,
        commentContent: commentComment ?? _commentContent,
        path: path ?? _path,
        holdCount: holdCount ?? _holdCount,
        commentNo: commentNo ?? _commentNo,
        level: level ?? _level,
        postNo: postNo ?? _postNo,
        parentCommentNo: parentCommentNo ?? _parentCommentNo,
        insId: insId ?? _insId,
        writerName: writerName ?? _writerName,
      );

  String? get reportYn => _reportYn;

  String? get regDate => _regDate;

  String? get commentContent => _commentContent;

  List<int>? get path => _path;

  int? get holdCount => _holdCount;

  String? get commentNo => _commentNo;

  int? get level => _level;

  String? get postNo => _postNo;

  String? get parentCommentNo => _parentCommentNo;

  String? get insId => _insId;

  String? get writerName => _writerName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['report_yn'] = _reportYn;
    map['reg_date'] = _regDate;
    map['comment_text'] = _commentContent;
    map['path'] = _path;
    map['onsk_tisu_cnt'] = _holdCount;
    map['cmt_no'] = _commentNo;
    map['level'] = _level;
    map['pst_no'] = _postNo;
    map['upper_cmt_no'] = _parentCommentNo;
    map['ins_id'] = _insId;
    map['write_nm'] = _writerName;
    return map;
  }
}
