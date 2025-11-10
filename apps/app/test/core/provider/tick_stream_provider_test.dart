import 'dart:async';

import 'package:app/core/provider/tick_stream_provider.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('tickStreamProvider', () {
    group('unaligned mode', () {
      test('30秒間隔でtickする', () async {
        final container = ProviderContainer();
        final provider = tickStreamProvider(
          duration: const Duration(seconds: 30),
          mode: TickMode.unaligned,
        );

        final values = <DateTime>[];
        final subscription = container.listen(
          provider,
          (previous, next) {
            switch (next) {
              case AsyncData(:final value):
                values.add(value);
              case AsyncLoading():
              case AsyncError():
                break;
            }
          },
        );

        await Future<void>.delayed(const Duration(milliseconds: 100));
        expect(values.length, greaterThanOrEqualTo(1));

        await Future<void>.delayed(const Duration(seconds: 35));
        expect(values.length, greaterThanOrEqualTo(2));

        subscription.close();
        container.dispose();
      });

      test('1分間隔でtickする', () async {
        final container = ProviderContainer();
        final provider = tickStreamProvider(
          duration: const Duration(minutes: 1),
          mode: TickMode.unaligned,
        );

        final values = <DateTime>[];
        final subscription = container.listen(
          provider,
          (previous, next) {
            switch (next) {
              case AsyncData(:final value):
                values.add(value);
              case AsyncLoading():
              case AsyncError():
                break;
            }
          },
        );

        await Future<void>.delayed(const Duration(milliseconds: 100));
        expect(values.length, greaterThanOrEqualTo(1));

        await Future<void>.delayed(const Duration(seconds: 65));
        expect(values.length, greaterThanOrEqualTo(2));

        subscription.close();
        container.dispose();
      });
    });

    group('aligned mode', () {
      test('30秒間隔の場合、次の00秒にalignされる', () {
        fakeAsync((FakeAsync async) {
          final container = ProviderContainer();
          final provider = tickStreamProvider(
            duration: const Duration(seconds: 30),
            mode: TickMode.aligned,
          );

          final values = <DateTime>[];
          final subscription = container.listen(
            provider,
            (previous, next) {
              switch (next) {
                case AsyncData(:final value):
                  values.add(value);
                case AsyncLoading():
                case AsyncError():
                  break;
              }
            },
          );

          async.elapse(const Duration(milliseconds: 100));
          expect(values.length, greaterThanOrEqualTo(1));

          async.elapse(const Duration(seconds: 30));
          expect(values.length, greaterThanOrEqualTo(2));

          subscription.close();
          container.dispose();
        });
      });

      test('5分間隔の場合、次の00分00秒にalignされる', () {
        fakeAsync((FakeAsync async) {
          final container = ProviderContainer();
          final provider = tickStreamProvider(
            duration: const Duration(minutes: 5),
            mode: TickMode.aligned,
          );

          final values = <DateTime>[];
          final subscription = container.listen(
            provider,
            (previous, next) {
              switch (next) {
                case AsyncData(:final value):
                  values.add(value);
                case AsyncLoading():
                case AsyncError():
                  break;
              }
            },
          );

          async.elapse(const Duration(milliseconds: 100));
          expect(values.length, greaterThanOrEqualTo(1));

          async.elapse(const Duration(minutes: 5));
          expect(values.length, greaterThanOrEqualTo(2));

          subscription.close();
          container.dispose();
        });
      });

      test('1時間間隔の場合、次の00時00分00秒にalignされる', () {
        fakeAsync((FakeAsync async) {
          final container = ProviderContainer();
          final provider = tickStreamProvider(
            duration: const Duration(hours: 1),
            mode: TickMode.aligned,
          );

          final values = <DateTime>[];
          final subscription = container.listen(
            provider,
            (previous, next) {
              switch (next) {
                case AsyncData(:final value):
                  values.add(value);
                case AsyncLoading():
                case AsyncError():
                  break;
              }
            },
          );

          async.elapse(const Duration(milliseconds: 100));
          expect(values.length, greaterThanOrEqualTo(1));

          async.elapse(const Duration(hours: 1));
          expect(values.length, greaterThanOrEqualTo(2));

          subscription.close();
          container.dispose();
        });
      });
    });
  });
}
