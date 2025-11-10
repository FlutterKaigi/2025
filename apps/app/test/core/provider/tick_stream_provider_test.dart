import 'dart:async';

import 'package:app/core/provider/tick_stream_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('tickStreamProvider', () {
    group('unaligned mode', () {
      test('30秒間隔でtickする', () async {
        final container = ProviderContainer();
        final stream = container.read(
          tickStreamProvider(
            duration: const Duration(seconds: 30),
            mode: TickMode.unaligned,
          ).stream,
        );

        final values = <DateTime>[];
        final subscription = stream.listen((DateTime value) {
          values.add(value);
        });

        await Future<void>.delayed(const Duration(milliseconds: 100));
        expect(values.length, greaterThanOrEqualTo(1));

        await Future<void>.delayed(const Duration(seconds: 35));
        expect(values.length, greaterThanOrEqualTo(2));

        await subscription.cancel();
        container.dispose();
      });

      test('1分間隔でtickする', () async {
        final container = ProviderContainer();
        final stream = container.read(
          tickStreamProvider(
            duration: const Duration(minutes: 1),
            mode: TickMode.unaligned,
          ).stream,
        );

        final values = <DateTime>[];
        final subscription = stream.listen((DateTime value) {
          values.add(value);
        });

        await Future<void>.delayed(const Duration(milliseconds: 100));
        expect(values.length, greaterThanOrEqualTo(1));

        await Future<void>.delayed(const Duration(seconds: 65));
        expect(values.length, greaterThanOrEqualTo(2));

        await subscription.cancel();
        container.dispose();
      });
    });

    group('aligned mode', () {
      test('30秒間隔の場合、次の00秒にalignされる', () {
        FakeAsync().run((FakeAsync async) {
          final container = ProviderContainer();
          async.elapse(Duration.zero);

          final stream = container.read(
            tickStreamProvider(
              duration: const Duration(seconds: 30),
              mode: TickMode.aligned,
            ).stream,
          );

          final values = <DateTime>[];
          final subscription = stream.listen((DateTime value) {
            values.add(value);
          });

          async.elapse(const Duration(milliseconds: 100));
          expect(values.length, greaterThanOrEqualTo(1));

          async.elapse(const Duration(seconds: 30));
          expect(values.length, greaterThanOrEqualTo(2));

          subscription.cancel();
          container.dispose();
        });
      });

      test('5分間隔の場合、次の00分00秒にalignされる', () {
        FakeAsync().run((FakeAsync async) {
          final container = ProviderContainer();
          final stream = container.read(
            tickStreamProvider(
              duration: const Duration(minutes: 5),
              mode: TickMode.aligned,
            ).stream,
          );

          final values = <DateTime>[];
          final subscription = stream.listen((DateTime value) {
            values.add(value);
          });

          async.elapse(const Duration(milliseconds: 100));
          expect(values.length, greaterThanOrEqualTo(1));

          async.elapse(const Duration(minutes: 5));
          expect(values.length, greaterThanOrEqualTo(2));

          subscription.cancel();
          container.dispose();
        });
      });

      test('1時間間隔の場合、次の00時00分00秒にalignされる', () {
        FakeAsync().run((FakeAsync async) {
          final container = ProviderContainer();
          final stream = container.read(
            tickStreamProvider(
              duration: const Duration(hours: 1),
              mode: TickMode.aligned,
            ).stream,
          );

          final values = <DateTime>[];
          final subscription = stream.listen((DateTime value) {
            values.add(value);
          });

          async.elapse(const Duration(milliseconds: 100));
          expect(values.length, greaterThanOrEqualTo(1));

          async.elapse(const Duration(hours: 1));
          expect(values.length, greaterThanOrEqualTo(2));

          subscription.cancel();
          container.dispose();
        });
      });
    });
  });
}

