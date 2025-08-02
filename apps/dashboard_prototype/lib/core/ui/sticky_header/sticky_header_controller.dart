import 'package:flutter/material.dart';

class StickyHeaderController extends ChangeNotifier {
  final Map<String, GlobalKey> _headerKeys = {};
  final Map<String, double> _headerHeights = {};
  ScrollController? _scrollController;

  void registerHeader(String id, GlobalKey key, double height) {
    _headerKeys[id] = key;
    _headerHeights[id] = height;
  }

  void setScrollController(ScrollController controller) {
    _scrollController?.removeListener(_onScroll);
    _scrollController = controller;
    _scrollController?.addListener(_onScroll);
  }

  void _onScroll() {
    notifyListeners();
  }

  double getHeaderOverlap(String id) {
    final key = _headerKeys[id];
    final height = _headerHeights[id];
    
    if (key == null || height == null || _scrollController == null) {
      return 0;
    }

    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return 0;

    final position = renderBox.localToGlobal(Offset.zero);
    final screenTop = 0.0;
    
    // ヘッダーが画面上部に到達している場合の重なり計算
    if (position.dy <= screenTop) {
      final overlap = screenTop - position.dy;
      return overlap.clamp(0, height);
    }
    
    return 0;
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_onScroll);
    super.dispose();
  }
}