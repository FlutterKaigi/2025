import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_lifecycle_provider.g.dart';

@riverpod
Stream<AppLifecycleState> appLifecycle(Ref ref) {
  late StreamController<AppLifecycleState> controller;
  late AppLifecycleListener listener;

  controller = StreamController<AppLifecycleState>(
    onListen: () {
      listener = AppLifecycleListener(
        onResume: () => controller.add(AppLifecycleState.resumed),
        onInactive: () => controller.add(AppLifecycleState.inactive),
        onPause: () => controller.add(AppLifecycleState.paused),
        onDetach: () => controller.add(AppLifecycleState.detached),
      );
    },
    onCancel: () {
      listener.dispose();
    },
  );

  ref.onDispose(() {
    unawaited(controller.close());
  });

  return controller.stream;
}
