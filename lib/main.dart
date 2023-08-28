import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totr/core/theme/sizes.dart';
import 'package:totr/router/router_provider.dart';
import 'package:totr/shared_widgets/userx.dart';
import 'package:totr/user_repo.dart';
import 'core/theme/dark_themes.dart';
import 'core/theme/light_themes.dart';


final themeProvider=StateProvider<bool>((ref) => true);

void main() async {

  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final List<UserX> users =ref.watch(usersListProvider).when(data: (users) =>users, error: (_,__)=>[], loading: ()=>[]);
    //print(users);
    ScreenSize.init(context);
    final isLightMode = ref.watch(themeProvider);
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightThemes(),
      darkTheme: darkThemes(),
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      themeMode:isLightMode ? ThemeMode.light:ThemeMode.dark,
      //home: child,
    );
  }
}

