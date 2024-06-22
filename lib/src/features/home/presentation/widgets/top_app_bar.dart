import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';
import 'package:wallies/src/features/home/presentation/widgets/custom_search_delegate.dart';
import 'package:wallies/src/features/index/presentation/bloc/index_bloc.dart';
import 'package:wallies/src/features/index/presentation/pages/index_screen.dart';

class TopAppBar extends StatefulWidget {
  TopAppBar({
    super.key,
    required this.appBarTitle,
    required this.searchEnabled,
    this.titleFontFamily,
    this.titleFontSize,
    this.appBarHeight = 72,
  });

  final String appBarTitle;
  String? titleFontFamily;
  double? titleFontSize;
  double appBarHeight;
  final bool searchEnabled;

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  // bool isSearchExpanded = false;

  // var searchFocusNode = FocusNode();

  late final IndexBloc indexBloc;

  @override
  void initState() {
    indexBloc = context.read<IndexBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.primaryBGColor,
      surfaceTintColor: AppColors.primaryBGColor,

      snap: true,
      primary: true,
      pinned: false,
      floating: true,
      // snap: false,
      // shape: const ContinuousRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(20),
      //     bottomRight: Radius.circular(20),
      //   ),
      // ),
      toolbarHeight: widget.appBarHeight,
      collapsedHeight: widget.appBarHeight,
      leadingWidth: 65,
      // expandedHeight: 200,
      leading: IconButton(
        style: IconButton.styleFrom(
          padding: EdgeInsets.only(
            bottom: 4,
            left: 5,
          ),
        ),
        icon: Icon(
          Icons.menu_rounded,
          color: AppColors.whiteColor,
          size: 24.sp,
        ),
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
      ),
      // GestureDetector(
      //   onTap: () {
      //     // indexBloc.isDrawerOpen.value = !indexBloc.isDrawerOpen.value;
      //
      //     // log('indexBloc.isDrawerOpen.value : ${indexBloc.isDrawerOpen.value}');
      //   },
      //   child: Container(
      //     margin: const EdgeInsets.only(
      //       left: 8,
      //       top: 13,
      //       bottom: 13,
      //       right: 5,
      //     ),
      //     decoration: BoxDecoration(
      //       border: Border.all(
      //         color: AppColors.grey400.withOpacity(0.65),
      //         width: 1,
      //       ),
      //       borderRadius: const BorderRadius.all(
      //         Radius.circular(10),
      //       ),
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Container(
      //               height: 11,
      //               width: 11,
      //               decoration: BoxDecoration(
      //                 color: AppColors.grey800,
      //                 borderRadius: const BorderRadius.all(
      //                   Radius.circular(3),
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(height: 5),
      //             Container(
      //               height: 13,
      //               width: 11,
      //               decoration: BoxDecoration(
      //                 color: AppColors.grey400,
      //                 borderRadius: const BorderRadius.all(
      //                   Radius.circular(3),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         const SizedBox(
      //           width: 5,
      //         ),
      //         Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Container(
      //               height: 13,
      //               width: 11,
      //               decoration: BoxDecoration(
      //                 color: AppColors.grey400,
      //                 borderRadius: const BorderRadius.all(
      //                   Radius.circular(3),
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(height: 5),
      //             Container(
      //               height: 11,
      //               width: 11,
      //               decoration: BoxDecoration(
      //                 color: AppColors.grey800,
      //                 borderRadius: const BorderRadius.all(
      //                   Radius.circular(3),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      titleSpacing: 5,
      title: Text(
        widget.appBarTitle,
        style: TextStyle(
          fontSize: widget.titleFontSize ?? 18.sp,
          fontWeight: FontWeight.normal,
          // fontSize: 36.sp,
          height: 1,
          fontFamily: widget.titleFontFamily,
          color: AppColors.whiteColor.withOpacity(0.8),
        ),
      ),
      actions: [
        !widget.searchEnabled
            ? const SizedBox()
            : IconButton(
                onPressed: () async {
                  await showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.whiteColor,
                ),
              ),
        const SizedBox(width: 10)
        // AnimatedContainer(
        //         duration: const Duration(milliseconds: 400),
        //         width: isSearchExpanded ? 83.w : 44.w,
        //         height: 45,
        //         margin: const EdgeInsets.only(right: 8),
        //         child: SearchBar(
        //           padding: MaterialStateProperty.resolveWith(
        //             (states) => const EdgeInsets.only(
        //                 left: 10, right: 10, top: 0, bottom: 0),
        //           ),
        //           backgroundColor: MaterialStateColor.resolveWith(
        //               (states) => AppColors.primaryBGColor),
        //           surfaceTintColor: MaterialStateColor.resolveWith(
        //               (states) => AppColors.primaryBGColor),
        //           overlayColor: MaterialStateColor.resolveWith(
        //               (states) => AppColors.primaryBGColor),
        //           trailing: [
        //             Icon(
        //               Icons.search_rounded,
        //               size: 20.sp,
        //               color: AppColors.whiteColor.withOpacity(0.35),
        //             ),
        //           ],
        //           autoFocus: false,
        //           focusNode: searchFocusNode,
        //           shape: MaterialStateProperty.resolveWith(
        //               (states) => const RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(28),
        //                     ),
        //                   )),
        //           side: MaterialStateProperty.resolveWith(
        //             (states) => BorderSide(
        //               color: AppColors.whiteColor.withOpacity(0.35),
        //               width: 1,
        //             ),
        //           ),
        //           onTap: () {
        //             setState(() {
        //               isSearchExpanded = true;
        //               indexBloc.isDrawerOpen.value = false;
        //             });
        //           },
        //           keyboardType: TextInputType.text,
        //           textInputAction: TextInputAction.search,
        //           textStyle: MaterialStateProperty.resolveWith(
        //             (states) => TextStyle(
        //               fontSize: 16.sp,
        //               color: AppColors.whiteColor.withOpacity(0.85),
        //               height: 1.1,
        //             ),
        //           ),
        //         ),
        //       ),
      ],
    );
  }
}
