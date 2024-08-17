import 'package:flutter/material.dart';

class AnimationLogoBar extends SliverPersistentHeaderDelegate {
  const AnimationLogoBar();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustedShrinkOffset =
        shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) * 0.5;
    // double topPadding = MediaQuery.of(context).padding.top + 16;
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Image.asset(
          'assets/images/womenVsMenLogo.png',
          width: offset,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  @override
  double get maxExtent => 280;

  @override
  double get minExtent => 140;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
