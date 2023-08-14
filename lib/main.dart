import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:totr/features/contacts/presentation/view/home_screen.dart';
import 'package:totr/providers/router_provider.dart';
import 'core/theme/dark_themes.dart';
import 'core/theme/light_themes.dart';
import 'features/login/presentation/view/get_started_screen.dart';
final themeProvider=StateProvider<bool>((ref) => true);

void main() async {

  runApp(const ProviderScope(child: MyApp()));
}
class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isLightMode = ref.watch(themeProvider);
    final router = ref.watch(routerProvider);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context ,child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: lightThemes(),
          darkTheme: darkThemes(),
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
          themeMode:!isLightMode ? ThemeMode.light:ThemeMode.dark,
          //home: child,
        );
      },
      //child: const HomeScreen(),
    );
  }
}
