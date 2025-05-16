import 'dart:convert';

import 'package:bff_client/bff_client.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:shelf/shelf.dart';

Future<Response> exceptionHandler(Future<Response> Function() fn) async {
  try {
    return await fn();
  } on AuthorizationException catch (e) {
    return Response(
      500,
      body: jsonEncode(
        ErrorResponse.errorCode(
          code: ErrorCode.unauthorized,
          detail:
              '認証エラーが発生しました: '
              '[${e.type.name}]: ${e.message ?? ""}',
        ).toJson(),
      ),
    );
  } on Exception catch (e) {
    return Response(
      500,
      body: jsonEncode(
        ErrorResponse.errorCode(
          code: ErrorCode.internalServerError,
          detail: 'ハンドルされていない例外が発生しました: ${e.runtimeType}',
        ).toJson(),
      ),
    );
  }
}
