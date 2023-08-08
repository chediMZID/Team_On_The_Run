// import 'dart:js';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:totr/contacts/presentation/screens/home_screen.dart';
// import 'package:totr/login/presentation/screens/get_started_screen.dart';
//
// final routerProvider = Provider<GoRouter>((ref) {
//   final router = RouteNotifier(ref);
//   return GoRouter(
//     debugLogDiagnostics: true,
//     refreshListenable: router,
//     routes: router._routes,
//   );
// });
//
// class RouteNotifier extends ChangeNotifier {
//   final Ref ref;
//   String? _redirectLogic(GoRouterState state){
//     return null;
//
//   }
//
//   RouteNotifier(this.ref);
//   List<GoRoute> get _routes => [
//     GoRoute(
//       name: 'login',
//       builder: (context,state) => GetStartedScreen(),
//
//       path: '/login',
//     ),
//     GoRoute(
//       name: 'contacts',
//       builder: (context,state) => HomeScreen(),
//       path: '/',
//     )
//   ];
//
// }