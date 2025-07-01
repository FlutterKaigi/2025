import 'package:engine/util/result.dart';
import 'package:test/test.dart';

class TestException implements Exception {
  final String message;
  TestException(this.message);
}

void main() {
  group('Result Tests', () {
    test('Success result unwraps correctly', () {
      final result = Result<int, TestException>.success(42);
      expect(result.unwrap, equals(42));
    });

    test('Failure result throws on unwrap', () {
      final result = Result<int, TestException>.failure(TestException('Test error'));
      expect(() => result.unwrap, throwsA(isA<TestException>()));
    });

    test('capture returns success for successful function', () async {
      final result = await Result.capture<int, TestException>(() async => 42);
      expect(result, isA<Success<int, TestException>>());
      expect(result.unwrap, equals(42));
    });

    test('capture returns failure for throwing function', () async {
      final result = await Result.capture<int, TestException>(
        () async => throw TestException('Test error'),
      );
      expect(result, isA<Failure<int, TestException>>());
    });

    test('captureSync returns success for successful function', () {
      final result = Result.captureSync<int, TestException>(() => 42);
      expect(result, isA<Success<int, TestException>>());
      expect(result.unwrap, equals(42));
    });

    test('captureSync returns failure for throwing function', () {
      final result = Result.captureSync<int, TestException>(
        () => throw TestException('Test error'),
      );
      expect(result, isA<Failure<int, TestException>>());
    });

    test('Success toString format is correct', () {
      final result = Result<int, TestException>.success(42);
      expect(result.toString(), equals('Success<int, TestException>(42)'));
    });

    test('Failure toString format is correct', () {
      final exception = TestException('Test error');
      final result = Result<int, TestException>.failure(exception);
      expect(result.toString(), startsWith('Failure<int, TestException>'));
    });
  });
}
