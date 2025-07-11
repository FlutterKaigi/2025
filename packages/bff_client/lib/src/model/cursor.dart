import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cursor.freezed.dart';
part 'cursor.g.dart';

@freezed
abstract class Cursor with _$Cursor {
  const factory Cursor({
    required CursorType type,
    required String id,
  }) = _Cursor;

  factory Cursor.fromBase64(String base64) {
    final decoded = utf8.decode(base64Decode(base64));
    final parts = decoded.split('\t');
    if (parts.length != 2) {
      throw Exception('Invalid cursor format: $base64');
    }

    return Cursor(
      type: CursorType.values.firstWhere((e) => e.name == parts[0]),
      id: parts[1],
    );
  }

  factory Cursor.fromJson(Map<String, dynamic> json) => _$CursorFromJson(json);

  factory Cursor.paging(String id) => Cursor(
    type: CursorType.paging,
    id: id,
  );

  const Cursor._();

  String encodeBase64() => base64Encode(
    utf8.encode(
      '${type.name}\t$id',
    ),
  );
}

enum CursorType {
  paging,
}
