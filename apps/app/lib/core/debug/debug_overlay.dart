import 'dart:async';
import 'dart:math';
import 'package:app/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DebugOverlay extends HookWidget {
  const DebugOverlay({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        _DebugOverlay.attach(context: context);
        return _DebugOverlay.remove;
      },
      [],
    );
    return child;
  }
}

class _DebugOverlay extends StatelessWidget {
  const _DebugOverlay({super.key});

  static OverlayEntry? _overlayEntry;

  static void attach({
    required BuildContext context,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final overlay = Overlay.of(context);
      _overlayEntry = OverlayEntry(
        builder: (context) => const _DebugOverlay(),
      );
      overlay.insert(_overlayEntry!);
    });
  }

  static void remove() {
    _overlayEntry?.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const _DraggableButton();
  }
}

class _DraggableButton extends StatefulWidget {
  const _DraggableButton();

  @override
  State<_DraggableButton> createState() => _DraggableButtonState();
}

const _buttonSize = Size.square(48);
const _padding = 8.0;

class _DraggableButtonState extends State<_DraggableButton>
    with WidgetsBindingObserver {
  double _dx = 0;
  double _dy = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.sizeOf(context);
      setState(() {
        // ボタンの初期位置を設定
        // - X: 画面右端からボタンの幅と余白分だけ左にずらした位置
        // - Y: 画面の縦中央にボタンの中心が来るように配置
        _dx = size.width - (_buttonSize.width + _padding);
        _dy = (size.height / 2) - (_buttonSize.height / 2);
      });
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _updatePosition(context),
    );
  }

  void _updatePosition(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    setState(() {
      // ボタンが画面端にめり込まないように調整
      // - X: ボタンが画面の左端（余白分を考慮した位置）より左や、右端（画面幅-ボタン幅-余白）より右に行かないよう制限
      // - Y: ボタンが画面の上端（余白分を考慮した位置）より上や、下端（画面高さ-ボタン高さ-余白）より下に行かないよう制限
      _dx = min(
        size.width - (_buttonSize.width + _padding),
        max(_padding, _dx),
      );
      _dy = min(
        size.height - (_buttonSize.height + _padding),
        max(_padding, _dy),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Positioned(
      top: _dy,
      left: _dx,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Draggable(
          feedback: _buildButton(context),
          childWhenDragging: const SizedBox.shrink(),
          onDragEnd: (dragDetails) {
            final dx = dragDetails.offset.dx;
            final dy = dragDetails.offset.dy;
            setState(() {
              // ボタンが画面端にめり込まないように調整
              _dx = min(
                size.width - (_buttonSize.width + _padding),
                max(_padding, dx),
              );
              _dy = min(
                size.height - (_buttonSize.height + _padding),
                max(_padding, dy),
              );
            });
          },
          child: _buildButton(context),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        unawaited(
          const DebugRoute().push<void>(context),
        );
      },
      child: AbsorbPointer(
        child: Container(
          height: _buttonSize.height,
          width: _buttonSize.width,
          decoration: const BoxDecoration(
            color: Colors.black54,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.bug_report,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
