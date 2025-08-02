import 'package:flutter/material.dart';
import 'sticky_header_delegate.dart';
import 'sticky_header_controller.dart';

class CustomStickyHeader extends StatefulWidget {
  const CustomStickyHeader({
    required this.header,
    required this.sliver,
    required this.headerId,
    required this.controller,
    this.headerHeight = 56.0,
    super.key,
  });

  final Widget header;
  final Widget sliver;
  final String headerId;
  final StickyHeaderController controller;
  final double headerHeight;

  @override
  State<CustomStickyHeader> createState() => _CustomStickyHeaderState();
}

class _CustomStickyHeaderState extends State<CustomStickyHeader> {
  final GlobalKey _headerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.controller.registerHeader(
      widget.headerId,
      _headerKey,
      widget.headerHeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        AnimatedBuilder(
          animation: widget.controller,
          builder: (context, child) {
            final overlap = widget.controller.getHeaderOverlap(widget.headerId);
            
            return SliverPersistentHeader(
              key: _headerKey,
              pinned: true,
              delegate: StickyHeaderDelegate(
                child: widget.header,
                height: widget.headerHeight,
                overlapHeight: overlap,
              ),
            );
          },
        ),
        widget.sliver,
      ],
    );
  }
}