import 'package:app/view/auth/auth_screen.dart';
import 'package:app/view/post/post_list_screen.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['/', 'auth'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      if (state.uri.path == '/auth')
        const BeamPage(child: AuthScreen())
      else
        const BeamPage(
            key: ValueKey('postList'),
            title: 'PostList',
            child: PostListScreen())
    ];
  }
}
