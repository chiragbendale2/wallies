// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    super.key,
    required this.items,
    this.backgroundColor,
    this.currentIndex = 0,
    this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedColorOpacity,
    this.itemShape = const StadiumBorder(),
    this.margin = const EdgeInsets.all(8),
    this.itemPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutQuint,
    this.selectedItemSplashColor = AppColors.primaryColor,
  });

  /// A list of tabs to display, ie `Home`, `Likes`, etc
  final List<BottomNavBarItem> items;

  /// The tab to display.
  final int currentIndex;

  /// Returns the index of the tab that was tapped.
  final Function(int)? onTap;

  /// The background color of the bar.
  final Color? backgroundColor;

  /// The color of the icon and text when the item is selected.
  final Color? selectedItemColor;

  /// The color of the icon and text when the item is not selected.
  final Color? unselectedItemColor;

  /// The color of the icon and text when the item is not selected.
  Color? selectedItemSplashColor;

  /// The opacity of color of the touchable background when the item is selected.
  final double? selectedColorOpacity;

  /// The border shape of each item.
  final ShapeBorder itemShape;

  /// A convenience field for the margin surrounding the entire widget.
  final EdgeInsets margin;

  /// The padding of each item.
  final EdgeInsets itemPadding;

  /// The transition duration
  final Duration duration;

  /// The transition curve
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GlassContainer(
      blur: 2,
      radius: 20,
      height: 68,
      linearGradient: LinearGradient(
        colors: [
          AppColors.blackColor.withOpacity(0.35),
          AppColors.primaryColor.withOpacity(0.35),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // begin: currentIndex == 0
        //     ? Alignment.centerLeft
        //     : currentIndex == 1
        //         ? Alignment.topLeft
        //         : currentIndex == 2
        //             ? Alignment.bottomRight
        //             : currentIndex == 3
        //                 ? Alignment.centerRight
        //                 : Alignment.topCenter,
        // end: currentIndex == 0
        //     ? Alignment.centerRight
        //     : currentIndex == 1
        //         ? Alignment.bottomRight
        //         : currentIndex == 2
        //             ? Alignment.topLeft
        //             : currentIndex == 3
        //                 ? Alignment.centerLeft
        //                 : Alignment.bottomCenter,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(0)),
      child: Padding(
        padding: margin,
        child: Row(
          /// Using a different alignment when there are 2 items or less
          /// so it behaves the same as BottomNavigationBar.
          mainAxisAlignment: items.length <= 2
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.spaceBetween,
          children: [
            for (final item in items)
              TweenAnimationBuilder<double>(
                tween: Tween(
                  end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
                ),
                curve: curve,
                duration: duration,
                builder: (context, t, _) {
                  final selectedColor = item.selectedColor ??
                      selectedItemColor ??
                      theme.primaryColor;

                  final unselectedColor = item.unselectedColor ??
                      unselectedItemColor ??
                      theme.iconTheme.color;

                  return Material(
                    color: Color.lerp(
                        selectedItemSplashColor!.withOpacity(0.0),
                        selectedItemSplashColor!
                            .withOpacity(selectedColorOpacity ?? 0.1),
                        t),
                    shape: itemShape,
                    child: InkWell(
                      onTap: () => onTap?.call(items.indexOf(item)),
                      customBorder: itemShape,
                      focusColor: selectedItemSplashColor!.withOpacity(0.1),
                      highlightColor: selectedItemSplashColor!.withOpacity(0.1),
                      splashColor: selectedItemSplashColor!.withOpacity(0.1),
                      hoverColor: selectedItemSplashColor!.withOpacity(0.1),
                      child: Padding(
                        padding: itemPadding,
                        // (Directionality.of(context) == TextDirection.ltr
                        //     ? EdgeInsets.only(right: itemPadding.right * t)
                        //     : EdgeInsets.only(left: itemPadding.left * t)),
                        child: Row(
                          children: [
                            IconTheme(
                              data: IconThemeData(
                                color: Color.lerp(
                                    unselectedColor, selectedColor, t),
                                size: 24,
                              ),
                              child: items.indexOf(item) == currentIndex
                                  ? item.activeIcon ?? item.icon
                                  : item.icon,
                            ),
                            // ClipRect(
                            //   clipBehavior: Clip.antiAlias,
                            //   child: SizedBox(
                            //     /// TODO: Constrain item height without a fixed value
                            //     ///
                            //     /// The Align property appears to make these full height, would be
                            //     /// best to find a way to make it respond only to padding.
                            //     height: 20,
                            //     child: Align(
                            //       alignment: const Alignment(-0.2, 0.0),
                            //       widthFactor: t,
                            //       child: Padding(
                            //         padding: Directionality.of(context) ==
                            //                 TextDirection.ltr
                            //             ? EdgeInsets.only(
                            //                 left: itemPadding.left / 2,
                            //                 right: itemPadding.right)
                            //             : EdgeInsets.only(
                            //                 left: itemPadding.left,
                            //                 right: itemPadding.right / 2),
                            //         child: DefaultTextStyle(
                            //           style: TextStyle(
                            //             color: Color.lerp(
                            //               selectedColor.withOpacity(0.0),
                            //               selectedColor,
                            //               t,
                            //             ),
                            //             fontWeight: FontWeight.w600,
                            //           ),
                            //           child: item.title,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

/// A tab to display in a [BottomNavBar]
class BottomNavBarItem {
  /// An icon to display.
  final Widget icon;

  /// An icon to display when this tab bar is active.
  final Widget? activeIcon;

  /// Text to display, ie `Home`
  final Widget title;

  /// A primary color to use for this tab.
  final Color? selectedColor;

  /// The color to display when this tab is not selected.
  final Color? unselectedColor;

  BottomNavBarItem({
    required this.icon,
    required this.title,
    this.selectedColor,
    this.unselectedColor,
    this.activeIcon,
  });
}
