import 'package:flutter/material.dart';
import 'package:wallies/src/core/utils/constant/app_colors.dart';

class RecentViewsGrid extends StatelessWidget {
  const RecentViewsGrid({super.key});

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

class WallPaperCard extends StatefulWidget {
  const WallPaperCard({
    super.key,
  });

  @override
  State<WallPaperCard> createState() => _WallPaperCardState();
}

class _WallPaperCardState extends State<WallPaperCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this, value: 1.0);

  bool _isFavorite = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://w0.peakpx.com/wallpaper/314/627/HD-wallpaper-spiderman-hero-super-superhero.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            icon: ScaleTransition(
              scale: Tween(begin: 0.7, end: 1.0).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
              child: _isFavorite
                  ? const Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_outline_rounded,
                      color: AppColors.whiteColor,
                      grade: 1,
                      weight: 1,
                      size: 30,
                    ),
            ),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
              _controller.reverse().then((value) => _controller.forward());
            },
          ),
        ),
      ],
    );
  }
}
