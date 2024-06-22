// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';
import 'package:wallies/src/features/index/presentation/pages/index_screen.dart';
import 'package:wallies/src/features/my_wallies/presentation/bloc/my_wallies_bloc.dart';

class MyWalliesScreen extends StatefulWidget {
  const MyWalliesScreen({super.key}); 

  @override
  State<MyWalliesScreen> createState() => _MyWalliesScreenState();
}

class _MyWalliesScreenState extends State<MyWalliesScreen> {
  late final MyWalliesBloc myWalliesBloc;

  @override
  void initState() {
    myWalliesBloc = context.read<MyWalliesBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            // const TopAppBar(
            //   appBarTitle: 'My Wallies',
            //   searchEnabled: false,
            // ),
            SliverAppBar(
              backgroundColor: AppColors.primaryBGColor,
              surfaceTintColor: AppColors.primaryBGColor,
              snap: true,
              primary: true,
              pinned: false,
              floating: true,
              toolbarHeight: 72,
              collapsedHeight: 72,
              leadingWidth: 65,
              titleSpacing: 5,
              leading: IconButton(
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.only(
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
              title: Text(
                'my wallies',
                style: TextStyle(
                  fontSize: 23.sp,
                  height: 1,
                  fontFamily: 'MarcheScript',
                  fontWeight: FontWeight.normal,
                  color: AppColors.whiteColor.withOpacity(0.8),
                ),
              ),
            ),
          ];
        },
        // physics: const NeverScrollableScrollPhysics(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ValueListenableBuilder(
                  valueListenable: myWalliesBloc.autoWallChanger,
                  builder: (context, s, c) {
                    return AccountListItem(
                      titleText: 'Auto Change',
                      leading: const Icon(
                        Icons.change_circle_outlined,
                        color: AppColors.whiteColor,
                      ),
                      subtitle: 'Change wallpaper periodically, based on the conditions below.',
                      trailing: Switch(
                        activeColor: AppColors.primaryColor,
                        activeTrackColor: AppColors.primaryLightColor,
                        inactiveTrackColor: AppColors.primaryBGColor,
                        inactiveThumbColor: AppColors.primaryLightColor,
                        trackOutlineColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.primaryLightColor,
                        ),
                        value: myWalliesBloc.autoWallChanger.value,
                        onChanged: (value) {
                          myWalliesBloc.autoWallChanger.value =
                              !myWalliesBloc.autoWallChanger.value;
                        },
                      ),
                      onTap: () {},
                    );
                  }),
              Divider(color: AppColors.grey800, height: 10, thickness: 1),
              AccountListItem(
                titleText: 'Recommend',
                subtitle: 'Share this app with friends and family.',
                leading: const Icon(
                  Icons.share_rounded,
                  color: AppColors.whiteColor,
                ),
                onTap: () {},
              ),
              AccountListItem(
                titleText: 'Rate App',
                subtitle: 'Consider giving us a review on the Google Play Store',
                leading: const Icon(
                  Icons.star_rate_rounded,
                  color: AppColors.whiteColor,
                ),
                onTap: () {},
              ),
              AccountListItem(
                titleText: 'Send Feedback',
                subtitle: 'Tell me what you think, suggest ideas, bug reports and improvements.',
                leading: const Icon(
                  Icons.wifi_calling_3_sharp,
                  color: AppColors.whiteColor,
                ),
                onTap: () {},
              ),
              AccountListItem(
                titleText: 'About Us',
                leading: const Icon(
                  Icons.supervisor_account_outlined,
                  color: AppColors.whiteColor,
                ),
                onTap: () {},
              ),
              AccountListItem(
                titleText: 'Privacy Policy',
                leading: const Icon(
                  Icons.privacy_tip_outlined,
                  color: AppColors.whiteColor,
                ),
                onTap: () {},
              ),
              AccountListItem(
                titleText: 'App Version',
                subtitle: '1.1.5',
                leading: const Icon(
                  Icons.info_outlined,
                  color: AppColors.whiteColor,
                ),
                onTap: () {},
              ),
              const LoginDismissWidget(),

              // AccountListItem(
              //   titleText: 'Logout',
              //   leading: const Icon(
              //     Icons.exit_to_app_rounded,
              //     color: AppColors.whiteColor,
              //   ),
              //   onTap: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginDismissWidget extends StatelessWidget {
  const LoginDismissWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login with Google',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    letterSpacing: 1,
                    fontSize: 17.sp,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Upload your favorite wallpapers and sync them with other devices.',
                  style: TextStyle(
                    color: AppColors.grey400,
                    // fontWeight: FontWeight.w300,
                    fontFamily: 'OpenSans',
                    fontSize: 15.sp,

                    // height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Column(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.whiteColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: AppColors.primaryBGColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: 16.5.sp,
                    // letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryBGColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'DISMISS',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: 16.5.sp,
                    // letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AccountListItem extends StatelessWidget {
  AccountListItem({
    super.key,
    required this.titleText,
    required this.leading,
    required this.onTap,
    this.trailing,
    this.subtitle,
  });

  final String titleText;
  final Widget leading;
  final void Function()? onTap;
  Widget? trailing;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: leading,
      ),
      minLeadingWidth: 45,
      splashColor: AppColors.transparent,
      hoverColor: AppColors.transparent,
      focusColor: AppColors.transparent,
      horizontalTitleGap: 5,
      title: Text(
        titleText,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
          fontFamily: 'OpenSans',
          letterSpacing: 1,
          fontSize: 16.5.sp,
        ),
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'OpenSans',
                // letterSpacing: 1,
                height: 1.4,
                fontSize: 15.sp,
              ),
            ),
      trailing: trailing,
    );
  }
}
