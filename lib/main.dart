import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallies/src/core/routes/routes.dart';
import 'package:wallies/src/core/styles/app_theme.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';
import 'package:wallies/src/shared/domain/injections/app_bloc_providers.dart';
import 'package:wallies/src/shared/domain/injections/app_injections.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: AppColors.blackColor,
    statusBarIconBrightness: Brightness.light,
  ));

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };

  // Inject all dependencies
  await initAppInjections();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.blocProviders,
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return GlassApp(
            theme: GlassThemeData(
              blur: 2,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: 0,
            ),
            home: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'The Wallies',
              themeMode: ThemeMode.dark,

              theme: AppTheme().darkTheme,
              routerConfig: Routes.router,
              // routeInformationProvider: Routes.router.routeInformationProvider,
              // routeInformationParser: Routes.router.routeInformationParser,
              // routerDelegate: Routes.router.routerDelegate,
            ),
          );
        },
      ),
    );
  }
}
