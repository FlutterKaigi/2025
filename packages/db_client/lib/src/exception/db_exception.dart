class DbException implements Exception {
  const DbException(this.type);

  final DbExceptionType type;
}

enum DbExceptionType {
  /// 引数で指定したデータが見つからない
  notFound,
}
