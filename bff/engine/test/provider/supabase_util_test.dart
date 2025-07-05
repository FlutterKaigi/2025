import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/result.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import 'package:test/test.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockGoTrueClient extends Mock implements GoTrueClient {}

class MockSupabaseUser extends Mock implements User {}

class MockSupabaseQueryBuilder extends Mock implements SupabaseQueryBuilder {}

void main() {
  group('SupabaseUtil', () {
    late MockSupabaseClient mockSupabaseClient;
    late MockGoTrueClient mockGoTrueClient;
    late MockSupabaseUser mockSupabaseUser;
    late MockSupabaseQueryBuilder mockSupabaseQueryBuilder;
    late SupabaseUtil supabaseUtil;

    setUp(() {
      mockSupabaseClient = MockSupabaseClient();
      mockGoTrueClient = MockGoTrueClient();
      mockSupabaseUser = MockSupabaseUser();
      mockSupabaseQueryBuilder = MockSupabaseQueryBuilder();
      supabaseUtil = SupabaseUtil(supabaseClient: mockSupabaseClient);
      
      when(() => mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
    });

    group('extractSupabaseUser', () {
      test('should return failure when Authorization header is missing', 
          () async {
        final request = Request('GET', Uri.parse('http://example.com'));
        final result = await supabaseUtil.extractSupabaseUser(request);
        
        expect(result, isA<Failure>());
      });

      test('should return failure when user is not found', () async {
        final request = Request('GET', Uri.parse('http://example.com'), 
            headers: {
          'authorization': 'Bearer token'
        });
        
        when(() => mockGoTrueClient.getUser('token')).thenAnswer((_) async => 
          const UserResponse(user: null));
        
        final result = await supabaseUtil.extractSupabaseUser(request);
        
        expect(result, isA<Failure>());
      });

      test('should return success when user is found', () async {
        final request = Request('GET', Uri.parse('http://example.com'), 
            headers: {
          'authorization': 'Bearer token'
        });
        
        when(() => mockGoTrueClient.getUser('token')).thenAnswer((_) async => 
          UserResponse(user: mockSupabaseUser));
        
        final result = await supabaseUtil.extractSupabaseUser(request);
        
        expect(result, isA<Success>());
      });
    });

    group('extractUser', () {
      test('should return failure when user is not found in database', 
          () async {
        final request = Request('GET', Uri.parse('http://example.com'), 
            headers: {
          'authorization': 'Bearer token'
        });
        
        when(() => mockGoTrueClient.getUser('token')).thenAnswer((_) async => 
          UserResponse(user: mockSupabaseUser));
        when(() => mockSupabaseUser.id).thenReturn('user-id');
        when(() => mockSupabaseClient.from('users'))
            .thenReturn(mockSupabaseQueryBuilder);
        
        final result = await supabaseUtil.extractUser(request);
        
        expect(result, isA<Failure>());
      });
    });
  });
}
