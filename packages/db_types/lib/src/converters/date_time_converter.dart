import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime?, dynamic> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    if (json is DateTime) {
      return fromJson(json.toIso8601String());
    }
    if (json is String) {
      if (json.contains('Z') || json.contains('+')) {
        return DateTime.parse(json);
      }
      return DateTime.parse('${json}Z');
    }
    throw ArgumentError(
      'Expected DateTime, String, or null, got ${json.runtimeType}',
    );
  }

  @override
  String? toJson(DateTime? object) {
    return object?.toIso8601String();
  }
}

class RequiredDateTimeConverter implements JsonConverter<DateTime, dynamic> {
  const RequiredDateTimeConverter();

  @override
  DateTime fromJson(dynamic json) {
    if (json == null) {
      throw ArgumentError('Required DateTime field cannot be null');
    }
    if (json is DateTime) {
      return fromJson(json.toIso8601String());
    }
    if (json is String) {
      if (json.contains('Z') || json.contains('+')) {
        return DateTime.parse(json);
      }
      return DateTime.parse('${json}Z');
    }
    throw ArgumentError('Expected DateTime or String, got ${json.runtimeType}');
  }

  @override
  String toJson(DateTime object) {
    return object.toIso8601String();
  }
}
