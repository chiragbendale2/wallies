import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallies/src/features/home/presentation/widgets/top_app_bar.dart';
import 'package:wallies/src/features/random/presentation/widgets/random_grid.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            TopAppBar(
              appBarTitle: 'Random',
              titleFontFamily: 'MarcheScript',
              titleFontSize: 23.sp,
              searchEnabled: false,
            ),
          ];
        },
        body: const SafeArea(
          child: RandomGrid(),
        ),
      ),
    );
  }
}
