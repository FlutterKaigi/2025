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
    required Flavor flavor,
    required String supabaseUrl,
    required String supabaseKey,
    required String bffBaseUrl,
    required String withdrawalFormUrl,
    String? commitInformation,
  }) = _Environment;

  factory Environment.fromEnvironment() => Environment(
    appIdSuffix: const String.fromEnvironment('APP_ID_SUFFIX'),
    appName: const String.fromEnvironment('APP_NAME'),
    flavor: Flavor.values.firstWhere(
      (e) => e.shortName == const String.fromEnvironment('FLAVOR'),
    ),
    supabaseUrl: const String.fromEnvironment('SUPABASE_URL'),
    supabaseKey: const String.fromEnvironment('SUPABASE_KEY'),
    bffBaseUrl: const String.fromEnvironment('BFF_BASE_URL'),
    withdrawalFormUrl: const String.fromEnvironment('WITHDRAWAL_FORM_URL'),
    commitInformation: () {
      const text = String.fromEnvironment('COMMIT_INFORMATION');
      if (text.isEmpty) {
        return null;
      }
      return text;
    }(),
  );

  factory Environment.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);
}

enum Flavor {
  production('prod'),
  staging('stg'),
  develop('dev');

  const Flavor(this.shortName);
  final String shortName;
}
