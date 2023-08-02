import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:totr/login/presentation/screens/get_started_screen.dart';

import 'core/theme/dark_themes.dart';
import 'core/theme/light_themes.dart';

void main() async {

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightThemes(),
          darkTheme: darkThemes(),
          themeMode:ThemeMode.light,
          home: child,
        );
      },
      child: const GetStartedScreen(),
    );
  }
}
