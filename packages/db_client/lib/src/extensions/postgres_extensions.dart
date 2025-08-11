import 'package:postgres/postgres.dart';

extension PostgresResultRowSafeExtensions on ResultRow {
  /// [UndecodedBytes] を適切に文字列に変換して安全な [Map] を返す
  Map<String, dynamic> toColumnMapSafe() {
    final map = <String, dynamic>{};
    for (final (i, col) in schema.columns.indexed) {
      final value = switch (this[i]) {
        final UndecodedBytes bytes => bytes.asString,
        _ => this[i],
      };

      if (col.columnName case final String name) {
        map[name] = value;
      } else {
        map['[$i]'] = value;
      }
    }
    return map;
  }
}
