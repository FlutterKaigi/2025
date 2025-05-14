import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:js_interop_utils/js_interop_utils.dart';

part 'cf_workers_env.freezed.dart';
part 'cf_workers_env.g.dart';

@freezed
abstract class CfWorkersEnv with _$CfWorkersEnv {
  const factory CfWorkersEnv({
    required String commitHash,
    required String supabaseUrl,
    required String supabaseServiceRoleKey,
  }) = _CfWorkersEnv;

  factory CfWorkersEnv.fromJson(Map<String, dynamic> json) =>
      _$CfWorkersEnvFromJson(json);
}

extension type CfWorkersJsEnv._(JSObject _) implements JSObject {
  @JS('COMMIT_HASH')
  external String get commitHash;

  @JS('SUPABASE_URL')
  external String get supabaseUrl;

  @JS('SUPABASE_SERVICE_ROLE_KEY')
  external String get supabaseServiceRoleKey;
}

extension CfWorkersJsEnvToDart on CfWorkersJsEnv {
  CfWorkersEnv get toDart => CfWorkersEnv(
    commitHash: commitHash,
    supabaseUrl: supabaseUrl,
    supabaseServiceRoleKey: supabaseServiceRoleKey,
  );
}
