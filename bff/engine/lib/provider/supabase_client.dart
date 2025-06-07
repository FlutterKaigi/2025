import 'package:engine/provider/cf_workers_env.dart';
import 'package:engine/provider/fetch_api_http_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase/supabase.dart';

part 'supabase_client.g.dart';

@Riverpod(keepAlive: true)
SupabaseClient supabaseClient(Ref ref) {
  final env = ref.watch(cfWorkersEnvProvider);
  return SupabaseClient(
    env.supabaseUrl,
    env.supabaseServiceRoleKey,
    httpClient: ref.watch(fetchApiHttpClientProvider),
  );
}
