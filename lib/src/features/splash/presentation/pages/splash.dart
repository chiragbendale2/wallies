import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallies/src/core/routes/app_routes.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterSplash();
    super.initState();
  }

  navigateAfterSplash() {
    // do async operation ( api call, auto login)
    Timer(
      const Duration(milliseconds: 2500),
      () {
        context.go(AppRoutes.index);
        // NavigationService().pushReplacement(AppRoutes.index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBGColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "wallies",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontFamily: 'MarcheScript',
                    color: AppColors.whiteColor,
                  ),
                ).animate().fade(duration: const Duration(milliseconds: 800)).scale(
                      begin: const Offset(1, 1),
                      end: const Offset(1.2, 1.2),
                      delay: const Duration(milliseconds: 600),
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 2000),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
