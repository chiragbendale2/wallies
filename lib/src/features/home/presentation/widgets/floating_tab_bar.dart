// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';

class FloatingTabBar extends StatefulWidget implements PreferredSizeWidget {
  FloatingTabBar({
    super.key,
    required this.tabController,
  });

  TabController tabController;

  @override
  State<FloatingTabBar> createState() => _FloatingTabBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 42);
}

class _FloatingTabBarState extends State<FloatingTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.primaryBGColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 10),
          TabBar(
            dividerHeight: 0,
            isScrollable: true,
            controller: widget.tabController,
            dividerColor: AppColors.transparent,
            automaticIndicatorColorAdjustment: true,
            tabAlignment: TabAlignment.start,
            padding: const EdgeInsets.only(),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: AppColors.transparent,
              border: BorderDirectional(
                bottom: BorderSide(
                  width: 1.5,
                  color: AppColors.whiteColor.withOpacity(0.7),
                ),
              ),
            ),
            labelColor: AppColors.whiteColor.withOpacity(0.7),
            labelPadding: const EdgeInsets.symmetric(horizontal: 18),
            unselectedLabelColor: AppColors.whiteColor.withOpacity(0.35),
            labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
            unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
            onTap: (ind) {
              // indexBloc.selectedIndex.value = ind;
            },
            tabs: const [
              Tab(
                child: Text('Recent Views'),
              ),
              Tab(
                child: Text('Popular'),
              ),
              Tab(
                child: Text('Trending'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
