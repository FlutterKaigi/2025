import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:engine/provider/supabase_client.dart';
import 'package:engine/util/result.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

part 'supabase_util.g.dart';

/// Internal record to hold combined user data including roles.
typedef UserRecord = ({
  User supabaseUser,
  Users dbUser,
  List<UserRole> roles,
});

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
  /// ユーザーを取得する
  /// Supabaseのユーザと、`public.users`テーブルのユーザ、および`public.user_roles`テーブルのロールを返す
  Future<Result<UserRecord, AuthorizationException>> extractUser(
    Request request,
  ) async => Result.capture(() async {
    final supabaseUserResult = await extractSupabaseUser(request);
    final supabaseUser = supabaseUserResult.unwrap;

    final dbUser = await _supabaseClient
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

    if (dbUser == null) {
      throw const AuthorizationException(
        AuthorizationExceptionType.userNotFound,
        'User exists but not found in the database (users table)',
      );
    }

    final roles = await _fetchUserRoles(supabaseUser.id);

    return (supabaseUser: supabaseUser, dbUser: dbUser, roles: roles);
  });

  /// Checks if the given UserRecord has the admin role.
  static bool isAdmin(UserRecord userRecord) {
    return userRecord.roles.contains(UserRole.admin);
  }

  /// Fetches user roles from the `user_roles` table.
  Future<List<UserRole>> _fetchUserRoles(String userId) async {
    final response = await _supabaseClient
        .from('user_roles')
        .select('role')
        .eq('user_id', userId);

    // response is List<Map<String, dynamic>>
    // e.g. [{'role': 'admin'}, {'role': 'staff'}]

    if (response.isEmpty) {
      return [];
    }

    final roles = response.map((row) {
      final roleString = row['role'] as String?;
      if (roleString == null) {
        // Log this unexpected case or handle as an error
        return null;
      }
      try {
        return UserRole.fromJson(roleString);
      } catch (e) {
        // Log error for invalid role string in DB
        // print('Error parsing role "$roleString": $e');
        return null;
      }
    }).whereType<UserRole>().toList(); // Filter out nulls (failed conversions)

    return roles;
  }

  Future<({List<UserListItem> users, int totalCount})> getUsersList({
    required int page,
    required int pageSize,
  }) async {
    final offset = (page - 1) * pageSize;

    // 1. Get total count
    // Note: Supabase PostgREST count can sometimes be an estimate.
    // For exact count, it might be a separate query or exact option.
    // The `count` option on a query is generally efficient.
    final countResponse = await _supabaseClient
        .from('users')
        .select('id', const FetchOptions(count: CountOption.exact));
    
    // The actual count is available in countResponse.count
    // If there's an error or count is null, default to 0 or handle error.
    final totalCount = countResponse.count ?? 0;

    if (totalCount == 0) {
      return (users: [], totalCount: 0);
    }
    
    // 2. Fetch paginated user data (Users objects)
    // Ensure the 'Users' model from db_types matches the selected columns.
    // Users model has: id (String), createdAt (DateTime)
    final dbUsersList = await _supabaseClient
        .from('users')
        .select('id, created_at') 
        .limit(pageSize)
        .offset(offset)
        .order('created_at', ascending: false) // Optional: order by creation date
        .withConverter((list) => list.map((e) => Users.fromJson(e)).toList());

    // 3. For each user, fetch roles and map to UserListItem
    List<UserListItem> userListItems = [];
    for (final dbUser in dbUsersList) {
      // Re-use the existing _fetchUserRoles method
      final roles = await _fetchUserRoles(dbUser.id); 
      
      userListItems.add(
        UserListItem(
          id: dbUser.id,
          createdAt: dbUser.createdAt,
          roles: roles,
        ),
      );
    }

    return (users: userListItems, totalCount: totalCount);
  }
}

class AuthorizationException implements Exception {
  const AuthorizationException(this.type, [this.message]);

  final AuthorizationExceptionType type;
  final String? message;
}

enum AuthorizationExceptionType { headerMissing, userNotFound }
