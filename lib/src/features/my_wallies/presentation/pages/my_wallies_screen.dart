// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';
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
        floatHeaderSlivers: false,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            // const TopAppBar(
            //   appBarTitle: 'My Wallies',
            //   searchEnabled: false,
            // ),
            SliverAppBar(
              backgroundColor: AppColors.primaryBGColor,
              surfaceTintColor: AppColors.primaryBGColor,

              primary: true,
              pinned: true,
              // snap: true,
              // pinned: true,
              // floating: true,
              // snap: false,
              // shape: const ContinuousRectangleBorder(
              //   borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(20),
              //     bottomRight: Radius.circular(20),
              //   ),
              // ),
              toolbarHeight: 72,
              collapsedHeight: 72,
              leadingWidth: 10,
              leading: const SizedBox(),
              title: Text(
                'My Wallies',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.whiteColor.withOpacity(0.8),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              AccountListItem(
                titleText: 'Login',
                leading: Icon(
                  Icons.login_rounded,
                  color: AppColors.whiteColor.withOpacity(0.6),
                ),
                onTap: () {},
              ),
              AccountListItem(
                titleText: 'Wallpapers',
                leading: Icon(
                  Icons.wallet_sharp,
                  color: AppColors.whiteColor.withOpacity(0.6),
                ),
                onTap: () {},
              ),
              ValueListenableBuilder(
                  valueListenable: myWalliesBloc.autoWallChanger,
                  builder: (context, s, c) {
                    return AccountListItem(
                      titleText: 'Auto Change',
                      leading: Icon(
                        Icons.change_circle_outlined,
                        color: AppColors.whiteColor.withOpacity(0.6),
                      ),
                      trailing: Switch(
                        activeColor: AppColors.primaryColor,
                        activeTrackColor: AppColors.primaryLightColor,
                        inactiveTrackColor: AppColors.grey400,
                        inactiveThumbColor: AppColors.whiteColor,
                        trackOutlineColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.primaryBGColor,
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
              AccountListItem(
                titleText: 'Share',
                leading: Icon(
                  Icons.share_rounded,
                  color: AppColors.whiteColor.withOpacity(0.6),
                ),
                onTap: () {},
              ),
              AccountListItem(
                titleText: 'Rate Us',
                leading: Icon(
                  Icons.star_rate_rounded,
                  color: AppColors.whiteColor.withOpacity(0.6),
                ),
                onTap: () {},
              ),
              AccountListItem(
                titleText: 'Contact Us',
                leading: Icon(
                  Icons.wifi_calling_3_sharp,
                  color: AppColors.whiteColor.withOpacity(0.6),
                ),
                onTap: () {},
              ),
              AccountListItem(
                titleText: 'About Us',
                leading: Icon(
                  Icons.info_rounded,
                  color: AppColors.whiteColor.withOpacity(0.6),
                ),
                onTap: () {},
              ),
              // AccountListItem(
              //   titleText: 'Copyright',
              //   leading: Icon(
              //     Icons.info_rounded,
              //     color: AppColors.whiteColor.withOpacity(0.6),
              //   ),
              //   onTap: () {},
              // ),
              AccountListItem(
                titleText: 'Exit',
                leading: Icon(
                  Icons.exit_to_app_rounded,
                  color: AppColors.whiteColor.withOpacity(0.6),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
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
  });

  final String titleText;
  final Widget leading;
  final void Function()? onTap;
  Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: leading,
      ),
      minLeadingWidth: 50,
      title: Text(
        titleText,
        style: TextStyle(
          color: AppColors.whiteColor.withOpacity(0.6),
          fontWeight: FontWeight.w400,
          letterSpacing: 1,
          fontSize: 17.5.sp,
        ),
      ),
      trailing: trailing,
    );
  }
}
