import 'package:app/view/auth/auth_screen.dart';
import 'package:app/view/home/home_screen.dart';
import 'package:app/view/post/post_screen.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

const locationHome = 'home';
const locationAuth = 'auth';
const locationPost = 'post';
const postId = '00';

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
  List<Pattern> get pathPatterns => ['/$locationPost/:$postId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final String? postIdParameter = state.pathParameters[postId];
    if (postIdParameter != null) {
      return [
        BeamPage(
            key: ValueKey('post-$postIdParameter'),
            child: PostScreen(
              postIdParameter,
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
