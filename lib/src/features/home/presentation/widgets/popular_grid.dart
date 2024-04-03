import 'package:flutter/material.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';

class PopularGrid extends StatelessWidget {
  const PopularGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: GridView.builder(
        addAutomaticKeepAlives: true,
        itemCount: 20,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 0.75,
          mainAxisExtent: 265,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.25),
                  Colors.black.withOpacity(0.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 0.7, 1],
              ),
            ),
            decoration: ShapeDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: Image.network(
              // '',
              'https://w0.peakpx.com/wallpaper/314/627/HD-wallpaper-spiderman-hero-super-superhero.jpg',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
