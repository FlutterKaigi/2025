import 'dart:io';

import 'package:db_types/db_types.dart';
import 'package:engine/provider/supabase_client.dart';
import 'package:engine/util/result.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

part 'supabase_util.g.dart';

@Riverpod(keepAlive: true)
SupabaseUtil supabaseUtil(Ref ref) {
  return SupabaseUtil(supabaseClient: ref.watch(supabaseClientProvider));
}

class SupabaseUtil {
  SupabaseUtil({required SupabaseClient supabaseClient})
    : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  /// Supabaseのユーザーを取得する
  Future<Result<User, AuthorizationException>> extractSupabaseUser(
    Request request,
  ) async => Result.capture(() async {
    final authorizationHeader =
        request.headers[HttpHeaders.authorizationHeader];
    if (authorizationHeader == null) {
      throw const AuthorizationException(
        AuthorizationExceptionType.headerMissing,
        'Authorization header is missing',
      );
    }
    final authorization = authorizationHeader.replaceAll('Bearer ', '');
    final userResponse = await _supabaseClient.auth.getUser(authorization);
    final user = userResponse.user;
    if (user == null) {
      throw const AuthorizationException(
        AuthorizationExceptionType.userNotFound,
        'User not exists',
      );
    }
    return user;
  });

  /// ユーザーを取得する
  /// Supabaseのユーザと、`public.users`テーブルのユーザを返す
  Future<Result<(User, Users), AuthorizationException>> extractUser(
    Request request,
  ) async => Result.capture(() async {
    final supabaseUserResult = await extractSupabaseUser(request);
    final supabaseUser = supabaseUserResult.unwrap;

    final user = await _supabaseClient
        .from('users')
        .select()
        .eq('id', supabaseUser.id)
        .maybeSingle()
        .withConverter((json) {
          if (json == null) {
            return null;
          }
          return Users.fromJson(json);
        });

    if (user == null) {
      throw const AuthorizationException(
        AuthorizationExceptionType.userNotFound,
        'User exists but not found in the database',
      );
    }

    return (supabaseUser, user);
  });
}

class AuthorizationException implements Exception {
  const AuthorizationException(this.type, [this.message]);

  final AuthorizationExceptionType type;
  final String? message;
}

enum AuthorizationExceptionType { headerMissing, userNotFound }
