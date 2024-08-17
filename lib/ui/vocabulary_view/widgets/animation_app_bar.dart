import 'package:flutter/material.dart';
import 'package:gender_fight/ui/vocabulary_view/widgets/background_wave.dart';

class AnimationAppBar extends SliverPersistentHeaderDelegate {
  const AnimationAppBar();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustedShrinkOffset =
        shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) * 0.5;
    double topPadding = MediaQuery.of(context).padding.top + 16;
    return Stack(
      children: [
        const BackgroundWave(
          height: 280,
        ),
        Positioned(
          top: topPadding,
          left: 16,
          right: 16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Słownictwo',
                style: TextStyle(
                    fontSize: 26, color: Colors.black.withOpacity(offset / 70)),
              ),
              Text(
                'W podstawowej wersji otrzymujesz 100 wyrażeń.',
                style: TextStyle(color: Colors.black.withOpacity(offset / 100)),
              ),
            ],
          ),
        ),
        Positioned(
          top: topPadding + offset,
          left: 16,
          right: 16,
          child: const Text(
              'Niech Wasze damsko - męskie wyrażenia będą bronią oraz powodem do dłuższych zabaw. Wybierz nowy pakiet i walczcie dalej!'),
        )
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
