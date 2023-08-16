
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:totr/features/channels/presentation/view/channels_screen.dart';
import 'package:totr/features/chats/presentation/view/chats_screen.dart';
import 'package:totr/features/more/presentation/view/more_screen.dart';
import 'package:totr/shared_widgets/home.dart';

import '../features/contacts/presentation/view/home_screen.dart';
import '../features/login/presentation/view/get_started_screen.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigator = GlobalKey(debugLabel: 'shell');

final routerProvider = Provider<GoRouter>((ref) {
  //final router = RouteNotifier(ref);
  return GoRouter(
    initialLocation: '/home',
    //debugLogDiagnostics: true,
    //refreshListenable: router,
    navigatorKey: rootNavigator,
    routes: [
      GoRoute(
        name: 'login',
        builder: (context,state) => GetStartedScreen(),
        path: '/login',
      ),
      ShellRoute(
        navigatorKey: shellNavigator,
        builder: (context,state,child) => Home(key: state.pageKey, child: child,),
        routes: [
          GoRoute(
            name: 'home',
            builder: (context,state) => HomeScreen(key: state.pageKey,),
            path: '/home',
          ),
          GoRoute(
            name: 'chats',
            builder: (context,state) => ChatsScreen(key: state.pageKey,),
            path: '/chats',
          ),
          GoRoute(
            name: 'channels',
            builder: (context,state) => ChannelsScreen(key: state.pageKey,),
            path: '/channels',
          ),
          GoRoute(
            name: 'more',
            builder: (context,state) => MoreScreen(key: state.pageKey,),
            path: '/more',
          ),

        ]
      )

    ],
  );
});


final navigationIndexProvider = StateProvider<int>((ref) => 0);
/*

class RouteNotifier extends ChangeNotifier {
  final Ref ref;
  String? _redirectLogic(GoRouterState state){
    return null;

  }

  RouteNotifier(this.ref);
  List<GoRoute> get _routes => [
    GoRoute(
      name: 'login',
      builder: (context,state) => GetStartedScreen(),

      path: '/login',
    ),
    GoRoute(
      name: 'contacts',
      builder: (context,state) => HomeScreen(),
      path: '/',
    )
  ];

}*/
