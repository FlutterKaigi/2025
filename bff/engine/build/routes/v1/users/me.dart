import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/exception_handler.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  return exceptionHandler(() async {
    final supabaseUtil = context.read<SupabaseUtil>();
    final result = await supabaseUtil.extractUser(context.request);
    final (_, user) = result.unwrap; // AuthorizationExceptionの場合はthrowされる
    final response = UserMeGetResponse(user: user);

    return Response.json(body: response.toJson());
  });
}
