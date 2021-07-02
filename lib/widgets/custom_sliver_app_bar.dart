import 'package:flutter/material.dart';
import 'package:sample_list/constants/transparent_image.dart';
import 'package:sample_list/models/restaurant.dart';

///Custom header for the product page.
class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  CustomSliverAppBar({required this.maxHeight, required this.restaurant});

  final Restaurant restaurant;
  final double maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
            opacity: 1 - (shrinkOffset / maxHeight),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: restaurant.image,
              fit: BoxFit.cover,
            )

            // Image.network(
            //   restaurant.image,
            //   filterQuality: FilterQuality.low,
            //   color: Colors.black.withOpacity(0.5),
            //   colorBlendMode: BlendMode.overlay,
            //   fit: BoxFit.cover,
            // ),
            ),
        Opacity(
          opacity: shrinkOffset / maxHeight,
          child: AppBar(
            title: Text(
              restaurant.title,
            ),
          ),
        ),
        Positioned(
          bottom: 25,
          left: 20,
          //alignment: Alignment.bottomLeft,
          child: Opacity(
            opacity: 1 - (shrinkOffset / maxHeight),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 8.0),
                      child: Text(
                        restaurant.type,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    restaurant.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 23),
                  ),
                  Text(
                    restaurant.location,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ]),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      this != oldDelegate;
}
