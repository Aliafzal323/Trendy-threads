import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trendy_threads/features/router/routes.dart';

class AppRouter {
  AppRouter({
    String? intiialRoute,
    List<RouteBase>? routes,
    GlobalKey<NavigatorState>? navigatorKey,
    List<NavigatorObserver>? observers,
  }) : router = GoRouter(
            navigatorKey: navigatorKey,
            debugLogDiagnostics: true,
            initialLocation: intiialRoute ?? AppRoutes.initial,
            routes: routes ?? AppRoutes.routes,
            observers: [...?observers],
            redirect: (context, state) async {
              // bool isAuthenticated = false;
              // if (!isAuthenticated && state.matchedLocation == '/') {
              //   return SignUpPage.route();
              // }

              // return null;
            });
  @visibleForTesting
  final GoRouter router;

  RouteInformationProvider get routeInformationProvider =>
      router.routeInformationProvider;

  RouteInformationParser<Object> get routeInformationParser =>
      router.routeInformationParser;

  RouterDelegate<Object> get routerDelegate => router.routerDelegate;
}

class AppRouterRefreshStream extends ChangeNotifier {
  AppRouterRefreshStream(List<Stream<dynamic>> streams) {
    notifyListeners();
    _subscriptions = streams
        .map((e) => e.asBroadcastStream().listen((_) => notifyListeners()))
        .toList();
  }

  late final List<StreamSubscription<dynamic>> _subscriptions;

  @override
  void dispose() {
    for (final e in _subscriptions) {
      e.cancel();
    }
    super.dispose();
  }
}
