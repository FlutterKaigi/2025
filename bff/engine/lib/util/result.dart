import 'dart:async';

/// [Result]は、成功した場合は[Success]、失敗した場合は[Failure]を返す。
sealed class Result<T, E extends Exception> {
  const Result._();

  /// [value]には成功した値を指定する。
  factory Result.success(T value) = Success<T, E>;

  /// [error]には例外を指定する。
  factory Result.failure(E error, [StackTrace stackTrace]) = Failure<T, E>;

  /// [unwrap]は、`Result`が`Success`を満たすことを前提として、値を取り出す時に利用します
  /// `Failure`の場合は、例外をthrowします
  T get unwrap => switch (this) {
    Success(:final value) => value,
    Failure(:final error) => throw error,
  };

  /// 非同期関数[fn]を実行し、成功した場合は[Result.success]にラップして返し、
  /// [E]型の例外が発生した場合は[Result.failure]にラップして返す。
  static Future<Result<T, E>> capture<T, E extends Exception>(
    FutureOr<T> Function() fn,
  ) async {
    try {
      return Result.success(await fn());
    } on E catch (e) {
      return Result.failure(e);
    }
  }

  /// 同期関数[fn]を実行し、成功した場合は[Result.success]にラップして返し、
  /// [E]型の例外が発生した場合は[Result.failure]にラップして返す。
  static Result<T, E> captureSync<T, E extends Exception>(T Function() fn) {
    try {
      return Result.success(fn());
    } on E catch (e) {
      return Result.failure(e);
    }
  }
}

class Success<T, E extends Exception> extends Result<T, E> {
  const Success(this.value) : super._();

  final T value;

  @override
  String toString() => 'Success<$T, $E>($value)';
}

class Failure<T, E extends Exception> extends Result<T, E> {
  const Failure(this.error, [this.stackTrace]) : super._();

  final E error;
  final StackTrace? stackTrace;

  @override
  String toString() => 'Failure<$T, $E>($error)';
}
