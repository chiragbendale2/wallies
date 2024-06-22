import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallies/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:wallies/src/features/home/presentation/widgets/floating_tab_bar.dart';
import 'package:wallies/src/features/home/presentation/widgets/popular_grid.dart';
import 'package:wallies/src/features/home/presentation/widgets/recent_views_grid.dart';
import 'package:wallies/src/features/home/presentation/widgets/top_app_bar.dart';
import 'package:wallies/src/features/home/presentation/widgets/trending_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late HomeBloc homeBloc;
  late TabController tabController;

  @override
  void initState() {
    homeBloc = context.read<HomeBloc>();
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DefaultTabController(
            length: 3,
            child: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  TopAppBar(
                    appBarTitle: 'wallies',
                    titleFontFamily: 'MarcheScript',
                    titleFontSize: 24.sp,
                    searchEnabled: true,
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                      minHeight: 42,
                      maxHeight: 42,
                      child: FloatingTabBar(
                        tabController: tabController,
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                controller: tabController,
                viewportFraction: 1,
                children: const [
                  RecentViewsGrid(),
                  PopularGrid(),
                  TrendingGrid(),
                ],
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: ValueListenableBuilder(
          //     valueListenable: indexBloc.isDrawerOpen,
          //     builder: (context, val, child) {
          //       return AnimatedContainer(
          //         height: indexBloc.isDrawerOpen.value ? 85.h : 0,
          //         width: indexBloc.isDrawerOpen.value ? 95.w : 0,
          //         margin: const EdgeInsets.only(
          //           left: 10,
          //           right: 10,
          //           top: 70,
          //           bottom: 20,
          //         ),
          //         decoration: BoxDecoration(
          //           color: AppColors.primaryBGColor.withOpacity(0.5),
          //           borderRadius: const BorderRadius.all(
          //             Radius.circular(20),
          //           ),
          //         ),
          //         duration: const Duration(milliseconds: 400),
          //         child: GlassContainer(
          //           blur: 1,
          //           radius: 20,
          //           child: SingleChildScrollView(
          //             child: Column(
          //               mainAxisSize: MainAxisSize.max,
          //               children: [
          //                 GridView.builder(
          //                   shrinkWrap: true,
          //                   itemCount: 10,
          //                   padding: const EdgeInsets.all(12),
          //                   physics:
          //                       const NeverScrollableScrollPhysics(),
          //                   gridDelegate:
          //                       const SliverGridDelegateWithFixedCrossAxisCount(
          //                     crossAxisCount: 2,
          //                     crossAxisSpacing: 10,
          //                     mainAxisSpacing: 10,
          //                     childAspectRatio: 1,
          //                   ),
          //                   itemBuilder: (context, index) {
          //                     return Container(
          //                       decoration: BoxDecoration(
          //                         borderRadius: const BorderRadius.all(
          //                           Radius.circular(20),
          //                         ),
          //                         color: AppColors.whiteColor
          //                             .withOpacity(0.2),
          //                       ),
          //                     );
          //                   },
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
