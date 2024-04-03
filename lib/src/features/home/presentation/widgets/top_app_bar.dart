import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';
import 'package:wallies/src/features/index/presentation/bloc/index_bloc.dart';

class TopAppBar extends StatefulWidget {
  const TopAppBar(
      {super.key, required this.appBarTitle, required this.searchEnabled});

  final String appBarTitle;
  final bool searchEnabled;

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  bool isSearchExpanded = false;

  var searchFocusNode = FocusNode();

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
      toolbarHeight: 72,
      collapsedHeight: 72,
      leadingWidth: 58,
      // expandedHeight: 200,
      leading: isSearchExpanded
          ? IconButton(
              onPressed: () {
                setState(() {
                  isSearchExpanded = false;
                });
                FocusScope.of(context).unfocus();
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: AppColors.primaryLightColor.withOpacity(0.85),
                size: 22.sp,
              ),
            )
          : GestureDetector(
              onTap: () {
                // indexBloc.isDrawerOpen.value = !indexBloc.isDrawerOpen.value;

                // log('indexBloc.isDrawerOpen.value : ${indexBloc.isDrawerOpen.value}');
              },
              child: Container(
                margin: const EdgeInsets.only(
                  left: 8,
                  top: 13,
                  bottom: 13,
                  right: 5,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.grey400.withOpacity(0.65),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 11,
                          width: 11,
                          decoration: BoxDecoration(
                            color: AppColors.grey800,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(3),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 13,
                          width: 11,
                          decoration: BoxDecoration(
                            color: AppColors.grey400,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(3),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 13,
                          width: 11,
                          decoration: BoxDecoration(
                            color: AppColors.grey400,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(3),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 11,
                          width: 11,
                          decoration: BoxDecoration(
                            color: AppColors.grey800,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      titleSpacing: isSearchExpanded ? 0 : 20,
      title: isSearchExpanded
          ? const SizedBox()
          : Text(
              widget.appBarTitle,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.whiteColor.withOpacity(0.8),
              ),
            ),
      actions: [
        !widget.searchEnabled
            ? const SizedBox()
            : AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isSearchExpanded ? 83.w : 44.w,
                height: 45,
                margin: const EdgeInsets.only(right: 8),
                child: SearchBar(
                  padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 0),
                  ),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.primaryBGColor),
                  surfaceTintColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.primaryBGColor),
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.primaryBGColor),
                  trailing: [
                    Icon(
                      Icons.search_rounded,
                      size: 20.sp,
                      color: AppColors.whiteColor.withOpacity(0.35),
                    ),
                  ],
                  autoFocus: false,
                  focusNode: searchFocusNode,
                  shape: MaterialStateProperty.resolveWith(
                      (states) => const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(28),
                            ),
                          )),
                  side: MaterialStateProperty.resolveWith(
                    (states) => BorderSide(
                      color: AppColors.whiteColor.withOpacity(0.35),
                      width: 1,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isSearchExpanded = true;
                      indexBloc.isDrawerOpen.value = false;
                    });
                  },
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  textStyle: MaterialStateProperty.resolveWith(
                    (states) => TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.whiteColor.withOpacity(0.85),
                      height: 1.1,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
