import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  NavigationService._internal();

  factory NavigationService() => _instance;

  navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  bool canPop() {
    return navigatorKey.currentState!.canPop();
  }

  pop<T>([T? value]) {
    return navigatorKey.currentContext!.pop(value);
  }

  popUntil(String desiredRoute) {
    return navigatorKey.currentState!.popUntil((route) {
      return route.settings.name == desiredRoute;
    });
  }

  go(route, {dynamic args}) {
    return navigatorKey.currentContext!.go(route, extra: args);
  }

  //  pushNamedAndRemoveUntil(
  //     String route, bool Function(Route<dynamic> route) popToInitial,
  //     {dynamic args}) {
  //   return navigatorKey.currentState!.pushAndRemoveUntil(route, extra: args);
  // }

  pushReplacement(String desiredRoute, {dynamic args}) {
    return navigatorKey.currentContext!
        .pushReplacement(desiredRoute, extra: args);
  }

  BuildContext getNavigationContext() {
    return navigatorKey.currentState!.context;
  }
}
