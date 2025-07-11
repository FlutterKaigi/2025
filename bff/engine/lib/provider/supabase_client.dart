import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase/supabase.dart';

part 'supabase_client.g.dart';

@Riverpod(keepAlive: true)
SupabaseClient supabaseClient(Ref ref) => SupabaseClient(
  Platform.environment['SUPABASE_URL']!,
  Platform.environment['SUPABASE_SERVICE_ROLE_KEY']!,
);
