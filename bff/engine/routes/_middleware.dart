import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import 'package:supabase/supabase.dart';

// Environment-based providers for Dart VM
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  final supabaseUrl = Platform.environment['SUPABASE_URL'] ?? 
      'https://default-url.supabase.co';
  final supabaseServiceRoleKey = Platform.environment['SUPABASE_SERVICE_ROLE_KEY'] ?? 
      'default-key';
  
  return SupabaseClient(
    supabaseUrl,
    supabaseServiceRoleKey,
    httpClient: http.Client(),
  );
});

final supabaseUtilProvider = Provider<SupabaseUtil>((ref) {
  return SupabaseUtil(supabaseClient: ref.watch(supabaseClientProvider));
});

Handler middleware(Handler handler) {
  return handler.use(
    provider<ProviderContainer>(
      (context) => ProviderContainer(
        overrides: [
          // Override providers with environment-based implementations
        ],
      ),
    ),
  ).use(
    provider<SupabaseUtil>(
      (context) {
        final container = context.read<ProviderContainer>();
        return container.read(supabaseUtilProvider);
      },
    ),
  );
}
