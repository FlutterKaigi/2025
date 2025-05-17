import 'package:bff_client/src/model/error/error_response.dart';
import 'package:test/test.dart';

void main() {
  group('ErrorResponse', () {
    test('fromJson - notImplemented', () {
      final json = <String, dynamic>{
        'code': 'NOT_IMPLEMENTED',
        'message': 'このエンドポイントは未実装です',
      };

      final result = ErrorResponse.fromJson(json);

      expect(result.code, ErrorCode.notImplemented);
      expect(result.message, 'このエンドポイントは未実装です');
      expect(result.detail, isNull);
    });

    test('fromJson - with detail', () {
      final json = <String, dynamic>{
        'code': 'INTERNAL_SERVER_ERROR',
        'message': 'サーバ内部で予期しないエラーが発生しました',
        'detail': 'エラーの詳細情報',
      };

      final result = ErrorResponse.fromJson(json);

      expect(result.code, ErrorCode.internalServerError);
      expect(result.message, 'サーバ内部で予期しないエラーが発生しました');
      expect(result.detail, 'エラーの詳細情報');
    });

    test('fromJson - unknown enum field', () {
      final json = <String, dynamic>{
        'code': 'HOGE_HOGE_ERROR',
        'message': 'enum ErrorCodeに存在していないエラーコード',
      };

      final result = ErrorResponse.fromJson(json);

      expect(result.code, ErrorCode.unknownEnumField);
      expect(result.message, 'enum ErrorCodeに存在していないエラーコード');
    });

    test('toJson', () {
      final errorResponse = ErrorResponse.errorCode(
        code: ErrorCode.internalServerError,
        detail: 'エラーの詳細情報',
      );

      final result = errorResponse.toJson();

      expect(result, {
        'code': 'INTERNAL_SERVER_ERROR',
        'message': 'サーバ内部で予期しないエラーが発生しました',
        'detail': 'エラーの詳細情報',
      });
    });
  });
}
