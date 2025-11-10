import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tick_stream_provider.g.dart';

enum TickMode {
  unaligned,
  aligned,
}

@riverpod
Stream<DateTime> tickStream(TickStreamRef ref, {
  required Duration duration,
  required TickMode mode,
}) async* {
  if (mode == TickMode.unaligned) {
    yield DateTime.now();
    yield* Stream.periodic(duration, (_) => DateTime.now());
  } else {
    final now = DateTime.now();
    final initialDelay = _calculateInitialDelay(now, duration);
    
    if (initialDelay > Duration.zero) {
      await Future<void>.delayed(initialDelay);
    }
    
    yield DateTime.now();
    yield* Stream.periodic(duration, (_) => DateTime.now());
  }
}

Duration _calculateInitialDelay(DateTime now, Duration duration) {
  if (duration < const Duration(minutes: 1)) {
    final nextSecond = now.copyWith(
      millisecond: 0,
      microsecond: 0,
    ).add(const Duration(seconds: 1));
    return nextSecond.difference(now);
  } else if (duration < const Duration(hours: 1)) {
    final nextMinute = now.copyWith(
      second: 0,
      millisecond: 0,
      microsecond: 0,
    ).add(const Duration(minutes: 1));
    return nextMinute.difference(now);
  } else if (duration < const Duration(days: 1)) {
    final nextHour = now.copyWith(
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    ).add(const Duration(hours: 1));
    return nextHour.difference(now);
  } else {
    return Duration.zero;
  }
}

