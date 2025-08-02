import 'package:flutter/material.dart';

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  const StickyHeaderDelegate({
    required this.child,
    required this.height,
    this.overlapHeight = 0,
  });

  final Widget child;
  final double height;
  final double overlapHeight;

  @override
  double get minExtent => height - overlapHeight;

  @override
  double get maxExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final adjustedHeight = height - shrinkOffset;
    
    return SizedBox(
      height: adjustedHeight,
      child: ClipRect(
        child: OverflowBox(
          minHeight: height,
          maxHeight: height,
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant StickyHeaderDelegate oldDelegate) {
    return child != oldDelegate.child ||
        height != oldDelegate.height ||
        overlapHeight != oldDelegate.overlapHeight;
  }
}