import 'package:flutter/material.dart';
import 'package:wallies/src/features/home/presentation/widgets/recent_views_grid.dart';

class RandomGrid extends StatelessWidget {
  const RandomGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        addAutomaticKeepAlives: true,
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 0.75,
          mainAxisExtent: 265,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return const WallPaperCard();
        },
      ),
    );
  }
}
