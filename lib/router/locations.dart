import 'package:app/view/auth/auth_screen.dart';
import 'package:app/view/post/post_list_screen.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class PostListLocations extends BeamLocation<BeamState> {
  @override
  // TODO: implement pathPatterns
  List<Pattern> get pathPatterns => ["/"];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(child: PostListScreen(), key: ValueKey('postList'))
    ];
    return pages;
  }
}

class AuthLocations extends BeamLocation<BeamState> {
  @override
  // TODO: implement pathPatterns
  List<Pattern> get pathPatterns => ["/auth"];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [BeamPage(child: AuthScreen(), key: const ValueKey('Auth'))];
    return pages;
  }
}
