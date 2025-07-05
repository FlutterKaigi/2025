import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import 'package:supabase/supabase.dart';


final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  final supabaseUrl = ArgumentError.checkNotNull(
    Platform.environment['SUPABASE_URL'],
  );
  final supabaseServiceRoleKey = ArgumentError.checkNotNull(
    Platform.environment['SUPABASE_SERVICE_ROLE_KEY'],
  );

  return SupabaseClient(
    supabaseUrl,
    supabaseServiceRoleKey,
    httpClient: http.Client(),
  );
});

final supabaseUtilProvider = Provider<SupabaseUtil>((ref) {
  return SupabaseUtil(supabaseClient: ref.watch(supabaseClientProvider));
});

Handler middleware(Handler handler) => handler
    .use(
      provider<ProviderContainer>(
        (context) => ProviderContainer(
          overrides: [
            // Override providers with environment-based implementations
          ],
        ),
      ),
    )
    .use(
      provider<SupabaseUtil>(
        (context) {
          final container = context.read<ProviderContainer>();
          return container.read(supabaseUtilProvider);
        },
      ),
    );
