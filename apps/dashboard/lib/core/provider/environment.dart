// ignore_for_file: do_not_use_environment

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'environment.freezed.dart';
part 'environment.g.dart';

@Riverpod(keepAlive: true)
Environment environment(Ref ref) => Environment.fromEnvironment();

@freezed
abstract class Environment with _$Environment {
  const factory Environment({
    required String appIdSuffix,
    required String appName,
    required String flavor,
    required String supabaseUrl,
    required String supabaseKey,
    required String bffBaseUrl,
  }) = _Environment;

  factory Environment.fromEnvironment() => const Environment(
    appIdSuffix: String.fromEnvironment('APP_ID_SUFFIX'),
    appName: String.fromEnvironment('APP_NAME'),
    flavor: String.fromEnvironment('FLAVOR'),
    supabaseUrl: String.fromEnvironment('SUPABASE_URL'),
    supabaseKey: String.fromEnvironment('SUPABASE_KEY'),
    bffBaseUrl: String.fromEnvironment('BFF_BASE_URL'),
  );

  factory Environment.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);
}
