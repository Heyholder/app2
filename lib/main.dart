import 'package:app/router/locations.dart';
import 'package:app/utils/material_color.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _routerDelegate = BeamerDelegate(
  locationBuilder: BeamerLocationBuilder(
      beamLocations: [PostListLocations(), AuthLocations()]),
  guards: [
    BeamGuard(
        pathPatterns: ['/'],
        check: (context, location) {
          return false;
        },
        beamToNamed: (origin, target) => "/auth")
  ],
);

Future<void> main() async {
  bool data = await fetchData();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: createMaterialColor(const Color(0xffe71915)),
              hintColor: const Color(0xffCACBD4),
              fontFamily: "DoHyeon"),
          routeInformationParser: BeamerParser(),
          routerDelegate: _routerDelegate,
        );
      },
    );
  }
}

Future<bool> fetchData() async {
  bool data = false;
  await Future.delayed(const Duration(seconds: 3), () {
    data = true;
  });
  return data;
}
