import 'package:flutter/material.dart';

/// CustomRouteObserver is a custom route observer that extends RouteObserver.
///  It is used to observe the route changes in the app.
@immutable
final class CustomRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  Future<void> didPush(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) async {
    super.didPush(route, previousRoute);
    // close if keyboard is open
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Future<void> didPop(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) async {
    super.didPop(route, previousRoute);

    // close if keyboard is open
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
