import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';
import 'package:wallies/src/core/routes/app_routes.dart';
import 'package:wallies/src/core/utils/constant/app_assets.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';
import 'package:wallies/src/core/utils/services/navigation_service.dart';

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
      const Duration(milliseconds: 3500),
      () {
        // context.go(AppRoutes.index);
        NavigationService().go(AppRoutes.index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBGColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.walliesLogo,
                  // height: 25.h,
                  width: 85.w,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 5.h),
            // Text(
            //   "WALLIES",
            //   style: TextStyle(
            //     fontSize: 24.sp,
            //     fontWeight: FontWeight.bold,
            //     color: AppColors.whiteColor.withOpacity(0.5),
            //     shadows: const [
            //       Shadow(
            //         color: AppColors.blueColor,
            //         blurRadius: 10,
            //         offset: Offset(3, 3),
            //       ),
            //       Shadow(
            //         color: AppColors.greenColor,
            //         blurRadius: 10,
            //         offset: Offset(-3, 3),
            //       ),
            //       Shadow(
            //         color: AppColors.pinkColor,
            //         blurRadius: 10,
            //         offset: Offset(0, -4),
            //       ),
            //     ],
            //   ),
            // ),
            const Spacer(),
            const Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 120,
                height: 120,
                child: RiveAnimation.asset(
                  'assets/animations/loading.riv',
                ),
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
