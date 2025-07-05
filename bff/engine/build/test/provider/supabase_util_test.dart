import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase/supabase.dart';
import 'package:test/test.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}
class MockGoTrueClient extends Mock implements GoTrueClient {}
class MockUserResponse extends Mock implements UserResponse {}
class MockUser extends Mock implements User {}

void main() {
  group('SupabaseUtil Tests', () {
    late MockSupabaseClient mockSupabaseClient;
    late MockGoTrueClient mockAuth;
    late SupabaseUtil supabaseUtil;

    setUp(() {
      mockSupabaseClient = MockSupabaseClient();
      mockAuth = MockGoTrueClient();
      supabaseUtil = SupabaseUtil(supabaseClient: mockSupabaseClient);
      
      when(() => mockSupabaseClient.auth).thenReturn(mockAuth);
    });

    test('extractSupabaseUser throws AuthorizationException when no auth header', () async {
      final request = Request.get(Uri.parse('http://localhost:8080/'));
      
      final result = await supabaseUtil.extractSupabaseUser(request);
      
      expect(result, isA<Failure>());
      expect(() => result.unwrap, throwsA(isA<AuthorizationException>()));
    });

    test('extractSupabaseUser throws AuthorizationException when user is null', () async {
      final headers = {HttpHeaders.authorizationHeader: 'Bearer test-token'};
      final request = Request.get(Uri.parse('http://localhost:8080/'), headers: headers);
      
      final mockUserResponse = MockUserResponse();
      when(() => mockUserResponse.user).thenReturn(null);
      when(() => mockAuth.getUser('test-token')).thenAnswer((_) async => mockUserResponse);
      
      final result = await supabaseUtil.extractSupabaseUser(request);
      
      expect(result, isA<Failure>());
      expect(() => result.unwrap, throwsA(isA<AuthorizationException>()));
    });

    test('extractSupabaseUser returns user when valid token', () async {
      final headers = {HttpHeaders.authorizationHeader: 'Bearer test-token'};
      final request = Request.get(Uri.parse('http://localhost:8080/'), headers: headers);
      
      final mockUser = MockUser();
      final mockUserResponse = MockUserResponse();
      when(() => mockUserResponse.user).thenReturn(mockUser);
      when(() => mockAuth.getUser('test-token')).thenAnswer((_) async => mockUserResponse);
      
      final result = await supabaseUtil.extractSupabaseUser(request);
      
      expect(result, isA<Success>());
      expect(result.unwrap, equals(mockUser));
    });

    test('AuthorizationException has correct properties', () {
      const exception = AuthorizationException(
        AuthorizationExceptionType.headerMissing,
        'Test message',
      );
      
      expect(exception.type, equals(AuthorizationExceptionType.headerMissing));
      expect(exception.message, equals('Test message'));
    });

    test('AuthorizationExceptionType enum values are correct', () {
      expect(AuthorizationExceptionType.values, hasLength(2));
      expect(AuthorizationExceptionType.values, contains(AuthorizationExceptionType.headerMissing));
      expect(AuthorizationExceptionType.values, contains(AuthorizationExceptionType.userNotFound));
    });
  });
}
