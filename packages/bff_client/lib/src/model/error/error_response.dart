import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@freezed
abstract class ErrorResponse with _$ErrorResponse implements Exception {
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

  const ErrorResponse._();

  factory ErrorResponse.errorCode({required ErrorCode code, String? detail}) =>
      ErrorResponse(
        code: code,
        message: code.message,
        detail: detail,
      );

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum ErrorCode {
  unauthorized('認証に失敗しました', HttpStatus.unauthorized),
  forbidden('リソースにアクセスする権限がありません', HttpStatus.forbidden),
  notFound('リソースが見つかりません', HttpStatus.notFound),
  conflict('リソースが競合しています', HttpStatus.conflict),
  notImplemented('このエンドポイントは未実装です', HttpStatus.notImplemented),
  internalServerError('サーバ内部で予期しないエラーが発生しました', HttpStatus.internalServerError),
  routeNotFound('ルーティングが見つかりませんでした', HttpStatus.notFound),
  badRequest('不正なリクエストです', HttpStatus.badRequest),
  proxyError('バックエンドサーバとの通信でエラーが発生しました', HttpStatus.internalServerError),
  rateLimitExceeded('レート制限を超えました', HttpStatus.tooManyRequests),
  upgradeRequired('Upgrade header is required', HttpStatus.upgradeRequired),

  // WARNING(YumNumm): 未知のエラーコードが返ってきた時に利用されます
  // サーバ側からこのエラーコードが返ってくることはありません
  unknownEnumField('不明なエラーです', -1)
  ;

  const ErrorCode(this.message, this.statusCode);

  final String message;
  final int statusCode;
}
