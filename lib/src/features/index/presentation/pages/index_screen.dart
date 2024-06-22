import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';
import 'package:wallies/src/features/categories/presentation/pages/categories_screen.dart';
import 'package:wallies/src/features/home/presentation/pages/home_screen.dart';
import 'package:wallies/src/features/index/presentation/bloc/index_bloc.dart';
import 'package:wallies/src/features/index/presentation/widgets/app_bottom_bar.dart';
import 'package:wallies/src/features/index/presentation/widgets/app_drawer.dart';
import 'package:wallies/src/features/my_wallies/presentation/pages/my_wallies_screen.dart';
import 'package:wallies/src/features/random/presentation/pages/random_screen.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen>
    with SingleTickerProviderStateMixin {
  late IndexBloc indexBloc;

  final pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const RandomScreen(),
    const MyWalliesScreen(),
  ];

  @override
  void initState() {
    indexBloc = context.read<IndexBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: IndexBloc(),
      builder: (context, state) => ValueListenableBuilder(
        valueListenable: indexBloc.selectedIndex,
        builder: (context, ind, wid) {
          return Scaffold(
            key: scaffoldKey,
            extendBody: true,
            backgroundColor: AppColors.primaryBGColor,
            resizeToAvoidBottomInset: false,
            drawer: AppDrawer(),
            body: SafeArea(
              child: IndexedStack(
                index: indexBloc.selectedIndex.value,
                children: pages,
              ),
            ),
            bottomNavigationBar: const AppBottomBar(),
          );
        },
      ),
    );
  }
}
