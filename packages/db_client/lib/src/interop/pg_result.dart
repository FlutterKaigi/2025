import 'dart:convert';

sealed class PgResult {
  const PgResult();
  List<Map<String, dynamic>> unwrap() => switch (this) {
    PgResultSuccess(:final value) => value,
    // ignore: only_throw_errors
    PgResultError() => throw this,
  };
}

class PgResultSuccess extends PgResult {
  const PgResultSuccess({required this.value});

  factory PgResultSuccess.fromJson(String json) =>
      PgResultSuccess(value: jsonDecode(json) as List<Map<String, dynamic>>);

  final List<Map<String, dynamic>> value;

  @override
  String toString() => 'PgResultSuccess: ${jsonEncode(value)}';
}

class PgResultError extends PgResult implements Exception {
  const PgResultError({required this.error});

  factory PgResultError.fromJson(String json) =>
      PgResultError(error: jsonDecode(json) as Map<String, dynamic>);

  final Map<String, dynamic> error;

  @override
  String toString() => 'PgResultError: ${jsonEncode(error)}';
}
