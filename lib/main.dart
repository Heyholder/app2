import 'package:app/router/locations.dart';
import 'package:app/states/auth_notifier.dart';
import 'package:app/states/post_notifier.dart';
import 'package:app/utils/material_color.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

final authNotifier = AuthenticationNotifier();

final _routerDelegate = BeamerDelegate(
  updateListenable: authNotifier,
  guards: [
    BeamGuard(
      beamToNamed: (origin, target) => '/auth',
      pathPatterns: ['/', ...PostLocation().pathPatterns],
      check: (context, location) {
        return Provider.of<AuthenticationNotifier>(context, listen: false)
            .isAuthenticated;
      },
    ),
    BeamGuard(
      beamToNamed: (origin, target) => '/',
      pathPatterns: ['/auth'],
      check: (context, location) {
        return !Provider.of<AuthenticationNotifier>(context, listen: false)
            .isAuthenticated;
      },
    )
  ],
  locationBuilder:
      BeamerLocationBuilder(beamLocations: [HomeLocation(), PostLocation()]),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthenticationNotifier>.value(
                value: authNotifier),
            ChangeNotifierProvider<PostNotifier>(create: (_) => PostNotifier())
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: createMaterialColor(const Color(0xffe71915)),
                dialogBackgroundColor: const Color(0xffC80E0A),
                hintColor: const Color(0xffCACBD4),
                fontFamily: "DoHyeon",
                textTheme: TextTheme(
                    headlineLarge: TextStyle(
                        fontSize: 24.0.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    headlineMedium: TextStyle(
                        fontSize: 15.0.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                    headlineSmall: TextStyle(
                        fontSize: 11.0.sp,
                        color: const Color(0xffFFCECE),
                        fontWeight: FontWeight.w300),
                    titleLarge: TextStyle(
                        fontSize: 17.0.sp,
                        color: const Color(0xff1E1E1E),
                        fontWeight: FontWeight.w500),
                    titleMedium: TextStyle(
                        fontSize: 11.0.sp,
                        color: const Color(0xff1E1E1E),
                        fontWeight: FontWeight.w400),
                    titleSmall: TextStyle(
                        fontSize: 11.0.sp,
                        color: const Color(0xff845EC5),
                        fontWeight: FontWeight.w400),
                    bodyLarge: TextStyle(
                        fontSize: 13.0.sp,
                        color: const Color(0xff696C75),
                        fontWeight: FontWeight.w400),
                    bodyMedium: TextStyle(
                        fontSize: 13.0.sp,
                        color: const Color(0xff7F8088),
                        fontWeight: FontWeight.w400),
                    bodySmall: TextStyle(
                        fontSize: 10.0.sp,
                        color: const Color(0xff7F8088),
                        fontWeight: FontWeight.w400)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Colors.white,
                    unselectedLabelStyle: TextStyle(
                        fontSize: 9.0.sp, color: const Color(0xffB9BAC5)),
                    selectedLabelStyle: TextStyle(
                        fontSize: 9.0.sp, color: const Color(0xffe71915)))),
            routeInformationParser: BeamerParser(),
            routerDelegate: _routerDelegate,
          ),
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

Future<void> main() async {
  bool data = await fetchData();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}
