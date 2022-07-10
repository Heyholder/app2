import 'package:app/view/post_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color(0xffe71915),
          hintColor: const Color(0xffFFCECE),
          dividerColor: const Color(0xffE5E5E5),
          disabledColor: const Color(0xffCACBD4),
          dialogBackgroundColor: const Color(0xffC80E0A),
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
              headlineLarge: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              headlineMedium: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
              headlineSmall: TextStyle(
                  fontSize: 11.0,
                  color: Color(0xffFFCECE),
                  fontWeight: FontWeight.w300),
              titleLarge: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xff1E1E1E),
                  fontWeight: FontWeight.w500),
              titleMedium: TextStyle(
                  fontSize: 11.0,
                  color: Color(0xff1E1E1E),
                  fontWeight: FontWeight.w400),
              titleSmall: TextStyle(
                  fontSize: 11.0,
                  color: Color(0xff845EC5),
                  fontWeight: FontWeight.w400),
              bodyLarge: TextStyle(
                  fontSize: 13.0,
                  color: Color(0xff696C75),
                  fontWeight: FontWeight.w400),
              bodyMedium: TextStyle(
                  fontSize: 13.0,
                  color: Color(0xff7F8088),
                  fontWeight: FontWeight.w400),
              bodySmall: TextStyle(
                  fontSize: 10.0,
                  color: Color(0xff7F8088),
                  fontWeight: FontWeight.w400))),
      initialRoute: '/',
      routes: {'/': (_) => PostList()},
    );
  }
}
