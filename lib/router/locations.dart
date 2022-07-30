import 'package:app/view/auth/auth_screen.dart';
import 'package:app/view/comment/comment_revise_screen.dart';
import 'package:app/view/comment/comment_screen.dart';
import 'package:app/view/home/home_screen.dart';
import 'package:app/view/post/post_screen.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

const locationHome = 'home';
const locationAuth = 'auth';
const locationPost = 'post';
const locationComment = 'post-comment';
const locationCommentRevise = 'comment-revise';
const postNo = "postNo";
const commentNo = "commentNo";

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['/', '/$locationAuth'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      if (state.uri.path == '/$locationAuth')
        const BeamPage(
            key: ValueKey(locationAuth),
            title: locationAuth,
            child: AuthScreen())
      else
        const BeamPage(
            key: ValueKey(locationHome),
            title: locationHome,
            child: HomeScreen())
    ];
  }
}

class PostLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['/$locationPost/:$postNo'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final String? postNoParameter = state.pathParameters[postNo];
    if (postNoParameter != null) {
      return [
        BeamPage(
            key: ValueKey('post-$postNoParameter'),
            child: PostScreen(
              postNoParameter,
            ))
      ];
    } else {
      return [
        const BeamPage(
            key: ValueKey(locationHome),
            title: locationHome,
            child: HomeScreen())
      ];
    }
  }
}

class CommentLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [
        '/$locationComment/:$postNo/:$commentNo',
        '/$locationCommentRevise/:$commentNo'
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final String? postNoParameter = state.pathParameters[postNo];
    final String? commentNoParameter = state.pathParameters[commentNo];

    return [
      if (state.pathParameters.containsKey(postNo))
        BeamPage(
            key: ValueKey('post-comment-$commentNoParameter'),
            child: CommentScreen(
              postNo: postNoParameter!,
              commentNo: commentNoParameter!,
            )),
      if (!state.pathParameters.containsKey(postNo))
        BeamPage(
            key: ValueKey('comment-revise-$commentNoParameter'),
            child: CommentReviseScreen(commentNo: commentNoParameter!))
    ];
  }
}
