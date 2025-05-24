import 'dart:convert';
import 'dart:io';

import 'package:bff_client/bff_client.dart' as bff;
import 'package:engine/api/v1/user_api_route.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/json_response.dart'; // For AuthorizationException
import 'package:engine/util/result.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart' as supabase; // For the User class
import 'package:db_types/db_types.dart' as db_types; // For the Users class
import 'package:test/test.dart';

// Import the generated mocks
import 'user_api_route_test.mocks.dart';

// Mock Supabase User and DB Users (if complex mocking is needed, otherwise can be simpler)
class MockSupabaseUser extends Mock implements supabase.User {}
class MockDbUsers extends Mock implements db_types.Users {}

void main() {
  late MockSupabaseUtil mockSupabaseUtil;
  late ProviderContainer container;
  late UserApiRoute userApiRoute;

  // Helper function to make requests
  Future<Response> makeRequest(
    String method,
    String path, {
    Map<String, String>? headers,
    String? body,
    Map<String, String>? queryParams,
  }) {
    var uri = Uri.parse('http://localhost');
    if (path.startsWith('/')) {
      uri = uri.replace(path: path);
    } else {
      uri = uri.replace(path: '/$path');
    }
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }
    
    final request = Request(
      method,
      uri,
      headers: headers ?? {'content-type': 'application/json'},
      body: body,
    );
    return userApiRoute.router.call(request);
  }

  setUp(() {
    mockSupabaseUtil = MockSupabaseUtil();
    container = ProviderContainer(overrides: [
      supabaseUtilProvider.overrideWithValue(mockSupabaseUtil),
    ]);
    userApiRoute = container.read(userApiRouteProvider);
  });

  tearDown(() {
    container.dispose();
  });

  group('GET /v1/users/list', () {
    final mockSupabaseLibUser = MockSupabaseUser();
    final mockDbUser = MockDbUsers();
    when(mockDbUser.id).thenReturn('db_user_id_1');
    when(mockDbUser.createdAt).thenReturn(DateTime.now());


    group('Authentication and Authorization', () {
      test('Unauthenticated access returns 401 (handled by extractUser)', () async {
        // Arrange
        when(mockSupabaseUtil.extractUser(any)).thenAnswer(
          (_) async => Result.failure(const AuthorizationException(AuthorizationExceptionType.headerMissing)),
        );

        // Act
        final response = await makeRequest('GET', '/list');

        // Assert
        expect(response.statusCode, HttpStatus.unauthorized);
        final responseBody = await response.readAsString();
        expect(jsonDecode(responseBody)['error'], contains('Authorization header is missing'));
      });

      test('Non-admin access returns 403 Forbidden', () async {
        // Arrange
        final userRecord = (
          supabaseUser: mockSupabaseLibUser,
          dbUser: mockDbUser,
          roles: [bff.UserRole.viewer], // Non-admin role
        );
        when(mockSupabaseUtil.extractUser(any)).thenAnswer((_) async => Result.success(userRecord));

        // Act
        final response = await makeRequest('GET', '/list');

        // Assert
        expect(response.statusCode, HttpStatus.forbidden);
        final responseBody = await response.readAsString();
        expect(jsonDecode(responseBody)['error'], 'User is not authorized to access this resource.');
      });
    });

    group('Admin Access - Successful Data Retrieval', () {
      final adminUserRecord = (
        supabaseUser: mockSupabaseLibUser,
        dbUser: mockDbUser,
        roles: [bff.UserRole.admin], // Admin role
      );

      setUp(() {
        // Common setup for admin access tests
        when(mockSupabaseUtil.extractUser(any)).thenAnswer((_) async => Result.success(adminUserRecord));
      });

      test('Returns 200 OK with correct data for admin', () async {
        // Arrange
        final expectedUsers = [
          bff.UserListItem(id: 'user1', createdAt: DateTime.now(), roles: [bff.UserRole.viewer]),
          bff.UserListItem(id: 'user2', createdAt: DateTime.now(), roles: [bff.UserRole.staff]),
        ];
        const expectedTotalCount = 25;
        const page = 1;
        const pageSize = 10;

        when(mockSupabaseUtil.getUsersList(page: page, pageSize: pageSize)).thenAnswer(
          (_) async => (users: expectedUsers, totalCount: expectedTotalCount),
        );

        // Act
        final response = await makeRequest('GET', '/list', queryParams: {'page': '$page', 'pageSize': '$pageSize'});
        
        // Assert
        expect(response.statusCode, HttpStatus.ok);
        final responseBody = await response.readAsString();
        final jsonBody = jsonDecode(responseBody);
        final actualResponse = bff.UserListResponse.fromJson(jsonBody);

        expect(actualResponse.users.length, expectedUsers.length);
        expect(actualResponse.totalCount, expectedTotalCount);
        expect(actualResponse.page, page);
        expect(actualResponse.pageSize, pageSize);
        // Could add more detailed checks for user data if necessary
      });
    });

    group('Pagination Parameter Testing (Admin User)', () {
      final adminUserRecord = (
        supabaseUser: mockSupabaseLibUser,
        dbUser: mockDbUser,
        roles: [bff.UserRole.admin],
      );
       final dummyUserListItem = bff.UserListItem(id: 'user1', createdAt: DateTime.now(), roles: [bff.UserRole.viewer]);

      setUp(() {
        when(mockSupabaseUtil.extractUser(any)).thenAnswer((_) async => Result.success(adminUserRecord));
      });

      test('Default parameters (page=1, pageSize=10)', () async {
        // Arrange
        when(mockSupabaseUtil.getUsersList(page: 1, pageSize: 10))
            .thenAnswer((_) async => (users: [dummyUserListItem], totalCount: 1));
        
        // Act
        final response = await makeRequest('GET', '/list');
        final jsonBody = jsonDecode(await response.readAsString());
        final actualResponse = bff.UserListResponse.fromJson(jsonBody);

        // Assert
        expect(response.statusCode, HttpStatus.ok);
        verify(mockSupabaseUtil.getUsersList(page: 1, pageSize: 10)).called(1);
        expect(actualResponse.page, 1);
        expect(actualResponse.pageSize, 10);
      });

      test('Custom parameters (page=2, pageSize=5)', () async {
        // Arrange
         when(mockSupabaseUtil.getUsersList(page: 2, pageSize: 5))
            .thenAnswer((_) async => (users: [dummyUserListItem], totalCount: 1));

        // Act
        final response = await makeRequest('GET', '/list', queryParams: {'page': '2', 'pageSize': '5'});
        final jsonBody = jsonDecode(await response.readAsString());
        final actualResponse = bff.UserListResponse.fromJson(jsonBody);
        
        // Assert
        expect(response.statusCode, HttpStatus.ok);
        verify(mockSupabaseUtil.getUsersList(page: 2, pageSize: 5)).called(1);
        expect(actualResponse.page, 2);
        expect(actualResponse.pageSize, 5);
      });

      test('PageSize capping (pageSize > 100)', () async {
        // Arrange
        when(mockSupabaseUtil.getUsersList(page: 1, pageSize: 100)) // MaxPageSize is 100
            .thenAnswer((_) async => (users: [dummyUserListItem], totalCount: 1));

        // Act
        final response = await makeRequest('GET', '/list', queryParams: {'pageSize': '150'});
        final jsonBody = jsonDecode(await response.readAsString());
        final actualResponse = bff.UserListResponse.fromJson(jsonBody);

        // Assert
        expect(response.statusCode, HttpStatus.ok);
        verify(mockSupabaseUtil.getUsersList(page: 1, pageSize: 100)).called(1);
        expect(actualResponse.pageSize, 100); // Capped value
      });

      // Invalid parameters
      test('Non-integer page returns 400 Bad Request', () async {
        final response = await makeRequest('GET', '/list', queryParams: {'page': 'abc'});
        expect(response.statusCode, HttpStatus.badRequest);
        expect(jsonDecode(await response.readAsString())['error'], "'page' parameter must be a valid integer.");
      });
      test('Non-integer pageSize returns 400 Bad Request', () async {
        final response = await makeRequest('GET', '/list', queryParams: {'pageSize': 'xyz'});
        expect(response.statusCode, HttpStatus.badRequest);
        expect(jsonDecode(await response.readAsString())['error'], "'pageSize' parameter must be a valid integer.");
      });
       test('Non-positive page (0) returns 400 Bad Request', () async {
        final response = await makeRequest('GET', '/list', queryParams: {'page': '0'});
        expect(response.statusCode, HttpStatus.badRequest);
        expect(jsonDecode(await response.readAsString())['error'], "'page' must be a positive integer.");
      });
      test('Non-positive page (-1) returns 400 Bad Request', () async {
        final response = await makeRequest('GET', '/list', queryParams: {'page': '-1'});
        expect(response.statusCode, HttpStatus.badRequest);
        expect(jsonDecode(await response.readAsString())['error'], "'page' must be a positive integer.");
      });
      test('Non-positive pageSize (0) returns 400 Bad Request', () async {
        final response = await makeRequest('GET', '/list', queryParams: {'pageSize': '0'});
        expect(response.statusCode, HttpStatus.badRequest);
        expect(jsonDecode(await response.readAsString())['error'], "'pageSize' must be a positive integer.");
      });
    });
  });
}
