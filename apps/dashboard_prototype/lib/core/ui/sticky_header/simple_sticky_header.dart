import 'package:flutter/material.dart';

class SimpleStickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  const SimpleStickyHeaderDelegate({
    required this.child,
    required this.height,
  });

  final Widget child;
  final double height;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      elevation: overlapsContent ? 4.0 : 0.0,
      child: SizedBox(
        height: height,
        child: child,
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SimpleStickyHeaderDelegate oldDelegate) {
    return child != oldDelegate.child || height != oldDelegate.height;
  }
}

class SimpleStickyHeader extends StatelessWidget {
  const SimpleStickyHeader({
    required this.header,
    required this.sliver,
    this.headerHeight = 56.0,
    super.key,
  });

  final Widget header;
  final Widget sliver;
  final double headerHeight;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: SimpleStickyHeaderDelegate(
            child: header,
            height: headerHeight,
          ),
        ),
        sliver,
      ],
    );
  }
}