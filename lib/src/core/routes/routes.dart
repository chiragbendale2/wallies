import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallies/src/core/routes/app_routes.dart';
import 'package:wallies/src/core/utils/services/navigation_service.dart';
import 'package:wallies/src/core/utils/services/navigator_observer.dart';
import 'package:wallies/src/features/categories/presentation/pages/categories_screen.dart';
import 'package:wallies/src/features/home/presentation/pages/home_screen.dart';
import 'package:wallies/src/features/index/presentation/pages/index_screen.dart';
import 'package:wallies/src/features/my_wallies/presentation/pages/my_wallies_screen.dart';
import 'package:wallies/src/features/random/presentation/pages/random_screen.dart';
import 'package:wallies/src/features/splash/presentation/pages/splash.dart';

class Routes {
  // GoRouter configuration
  static final router = GoRouter(
    observers: [AppNavigatorObserver()],
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: AppRoutes.splash,
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: AppRoutes.index,
        path: AppRoutes.index,
        // pageBuilder: (context, state) {
        //   return fadeRouteTransition(
        //     context: context,
        //     state: state,
        //     child: const IndexScreen(),
        //   );
        // },
        builder: (context, state) => const IndexScreen(),
      ),
      GoRoute(
        name: AppRoutes.home,
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: AppRoutes.categories,
        path: AppRoutes.categories,
        builder: (context, state) => const CategoriesScreen(),
      ),
      GoRoute(
        name: AppRoutes.random,
        path: AppRoutes.random,
        builder: (context, state) => const RandomScreen(),
      ),
      GoRoute(
        name: AppRoutes.mywallies,
        path: AppRoutes.mywallies,
        builder: (context, state) => const MyWalliesScreen(),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      return null;

      // var isAuthenticated = true;
      // // your logic to check if user is authenticated
      // if (!isAuthenticated) {
      //   return AppRoutes.splash;
      // } else {
      //   return null; // return "null" to display the intended route without redirecting
      // }
    },
  );
}
