import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallies/src/core/utils/constant/app_assets.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';
import 'package:wallies/src/features/index/presentation/bloc/index_bloc.dart';
import 'package:wallies/src/shared/presentation/widgets/bottom_nav_bar/bottom_nav_bar.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  late IndexBloc indexBloc;

  @override
  void initState() {
    indexBloc = context.read<IndexBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexBloc.selectedIndex,
      builder: (context, st, child) {
        return BottomNavBar(
          backgroundColor: AppColors.transparent,
          currentIndex: indexBloc.selectedIndex.value,
          // curve: Curves.fastOutSlowIn,
          itemPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 22,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),

          // itemShape: const ContinuousRectangleBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(80)),
          // ),
          // unselectedItemColor: AppColors.whiteColor.withOpacity(0.75),
          // selectedItemColor: AppColors.whiteColor.withOpacity(0.9),
          selectedItemSplashColor: AppColors.primaryLightColor,
          selectedColorOpacity: 0.35,
          onTap: (index) {
            indexBloc.selectedIndex.value = index;
          },
          items: [
            BottomNavBarItem(
              icon: Image.asset(
                AppAssets.homeIcon,
                color: AppColors.whiteColor.withOpacity(0.75),
                height: 22,
                width: 22,
              ),
              activeIcon: Image.asset(
                AppAssets.homeIcon,
                color: AppColors.whiteColor.withOpacity(0.9),
                height: 22,
                width: 22,
              ),
              title: const SizedBox(),
            ),
            BottomNavBarItem(
              icon: Image.asset(
                AppAssets.categoriesIcon,
                color: AppColors.whiteColor.withOpacity(0.75),
                height: 22,
                width: 22,
              ),
              activeIcon: Image.asset(
                AppAssets.categoriesIcon,
                color: AppColors.whiteColor.withOpacity(0.9),
                height: 22,
                width: 22,
              ),
              title: const SizedBox(),
            ),
            BottomNavBarItem(
              icon: Image.asset(
                AppAssets.randomIcon,
                color: AppColors.whiteColor.withOpacity(0.75),
                height: 22,
                width: 22,
              ),
              activeIcon: Image.asset(
                AppAssets.randomIcon,
                color: AppColors.whiteColor.withOpacity(0.9),
                height: 22,
                width: 22,
              ),
              title: const SizedBox(),
            ),
            BottomNavBarItem(
              icon: Image.asset(
                AppAssets.myAccountIcon,
                color: AppColors.whiteColor.withOpacity(0.75),
                height: 22,
                width: 22,
              ),
              activeIcon: Image.asset(
                AppAssets.myAccountIcon,
                color: AppColors.whiteColor.withOpacity(0.9),
                height: 22,
                width: 22,
              ),
              title: const SizedBox(),
            ),
          ],
        );
      },
    );
  }
}
