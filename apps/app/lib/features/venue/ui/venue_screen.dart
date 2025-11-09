import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// 会場マップ画面
///
/// 主な役割:
/// - 1Fと2Fのフロアマップを表示する
/// - セグメントボタンでフロアを切り替える
/// - InteractiveViewerでズーム・パン操作を提供する
class VenueScreen extends HookWidget {
  const VenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final currentFloor = useState(0); // 0: 1F, 1: 2F

    return Scaffold(
      appBar: AppBar(
        title: Text(t.venue.title),
      ),
      body: Stack(
        children: [
          _FloorMapView(
            currentFloor: currentFloor.value,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _FloorSwitcher(
              currentFloor: currentFloor,
              t: t,
            ),
          ),
        ],
      ),
    );
  }
}

class _FloorSwitcher extends StatelessWidget {
  const _FloorSwitcher({
    required this.currentFloor,
    required this.t,
  });

  final ValueNotifier<int> currentFloor;
  final Translations t;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SegmentedButton<int>(
        segments: [
          ButtonSegment(
            value: 0,
            label: Text(t.venue.floor1f),
          ),
          ButtonSegment(
            value: 1,
            label: Text(t.venue.floor2f),
          ),
        ],
        selected: {currentFloor.value},
        onSelectionChanged: (newSelection) {
          currentFloor.value = newSelection.first;
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return theme.colorScheme.primaryContainer;
              }
              return theme.colorScheme.surface;
            },
          ),
        ),
      ),
    );
  }
}

class _FloorMapView extends HookWidget {
  const _FloorMapView({
    required this.currentFloor,
  });

  final int currentFloor;

  @override
  Widget build(BuildContext context) {
    // フロアが変わるたびにTransformationControllerをリセット
    final transformationController = useMemoized(
      TransformationController.new,
      [currentFloor],
    );

    useEffect(
      () => transformationController.dispose,
      [transformationController],
    );

    final floorMapAsset = currentFloor == 0
        ? Assets.res.assets.floorMap1f
        : Assets.res.assets.floorMap2f;

    return InteractiveViewer(
      transformationController: transformationController,
      minScale: 0.5,
      maxScale: 4,
      child: Center(
        child: floorMapAsset.image(),
      ),
    );
  }
}
