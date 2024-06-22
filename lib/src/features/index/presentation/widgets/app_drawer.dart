import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallies/src/core/utils/constant/app_assets.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';
import 'package:wallies/src/features/my_wallies/presentation/pages/my_wallies_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: 97.w,
        backgroundColor: AppColors.primaryBGColor,
        surfaceTintColor: AppColors.primaryBGColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 97.w,
                height: 165,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  border: Border.all(
                    width: 0,
                    color: AppColors.transparent,
                  ),
                ),
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              boxShadow: const [],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  AppAssets.walliesLogo,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 18),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'wallies',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.normal,
                                  height: 1,
                                  fontFamily: 'MarcheScript',
                                  color: AppColors.whiteColor.withOpacity(0.8),
                                ),
                              ),
                              Text(
                                'ChiragBendale',
                                style: TextStyle(
                                  color: AppColors.whiteColor.withOpacity(0.8),
                                  // fontWeight: FontWeight.w400,
                                  fontFamily: 'OpenSans',
                                  // letterSpacing: 1,
                                  fontSize: 17.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    ListTile(
                      tileColor: AppColors.primaryColor,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                      leading: Icon(
                        Icons.account_circle_outlined,
                        size: 20.sp,
                        color: AppColors.whiteColor,
                      ),
                      horizontalTitleGap: 20,
                      title: Text(
                        'My Wallies',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 100),
              AccountListItem(
                leading: Icon(
                  Icons.water_drop,
                  size: 22.sp,
                  color: AppColors.whiteColor,
                ),
                titleText: 'pAInt',
                subtitle: 'Create AI Wallpapers',
                onTap: () {},
              ),
              Divider(thickness: 1, height: 10, color: AppColors.grey800),
              AccountListItem(
                leading: Icon(
                  Icons.wallpaper_outlined,
                  size: 20.sp,
                  color: AppColors.whiteColor,
                ),
                titleText: 'Wallpapers',
                onTap: () {},
              ),
              AccountListItem(
                leading: Icon(
                  Icons.video_camera_back_outlined,
                  size: 20.sp,
                  color: AppColors.whiteColor,
                ),
                titleText: 'Video Wallpapers',
                onTap: () {},
              ),
              AccountListItem(
                leading: Icon(
                  Icons.volume_up_rounded,
                  size: 20.sp,
                  color: AppColors.whiteColor,
                ),
                titleText: 'Ringtones',
                onTap: () {},
              ),
              AccountListItem(
                leading: Icon(
                  Icons.notifications,
                  size: 20.sp,
                  color: AppColors.whiteColor,
                ),
                titleText: 'Notification Sounds',
                onTap: () {},
              ),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  AccountListItem(
                    leading: Icon(
                      Icons.videogame_asset_outlined,
                      size: 20.sp,
                      color: AppColors.whiteColor,
                    ),
                    titleText: 'Games',
                    onTap: () {},
                  ),
                  Positioned(
                    right: 20,
                    // alignment: Alignment.centerRight,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: AppColors.primaryColor,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      child: Text(
                        'NEW',
                        style: TextStyle(
                          height: 1,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Divider(thickness: 1, height: 10, color: AppColors.grey800),
              AccountListItem(
                leading: Icon(
                  Icons.settings,
                  size: 20.sp,
                  color: AppColors.whiteColor,
                ),
                titleText: 'Settings',
                onTap: () {},
              ),
              AccountListItem(
                leading: Icon(
                  Icons.help_outline_outlined,
                  size: 20.sp,
                  color: AppColors.whiteColor,
                ),
                titleText: 'Help',
                onTap: () {},
              ),
              AccountListItem(
                leading: Icon(
                  Icons.info_outline_rounded,
                  size: 20.sp,
                  color: AppColors.whiteColor,
                ),
                titleText: 'Information',
                onTap: () {},
              ),
              AccountListItem(
                leading: Icon(
                  Icons.star_rate_rounded,
                  size: 22.sp,
                  color: AppColors.goldColor,
                ),
                titleText: 'Rate the app',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
