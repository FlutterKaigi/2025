import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@freezed
abstract class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    /// エラーコード
    @JsonKey(unknownEnumValue: ErrorCode.unknownEnumField)
    required ErrorCode code,

    /// エラーのメッセージ
    /// `code`の`message`に相当する
    required String message,

    /// エラーの詳細
    /// ユーザに表示することは想定されていない
    String? detail,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum ErrorCode {
  notImplemented('このエンドポイントは未実装です', HttpStatus.notImplemented),
  internalServerError('サーバ内部で予期しないエラーが発生しました', HttpStatus.internalServerError),
  routeNotFound('ルーティングが見つかりませんでした', HttpStatus.notFound),

  // WARNING(YumNumm): 道のエラーコードが返ってきた時に利用されます
  // サーバ側からこのエラーコードが返ってくることはありません
  unknownEnumField('不明なエラーです', -1);

  const ErrorCode(this.message, this.statusCode);

  final String message;
  final int statusCode;
}
