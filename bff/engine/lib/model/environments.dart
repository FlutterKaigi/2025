import 'package:freezed_annotation/freezed_annotation.dart';

part 'environments.freezed.dart';
part 'environments.g.dart';

@Freezed()
abstract class Environments with _$Environments {
  @JsonSerializable(fieldRename: FieldRename.screamingSnake)
  const factory Environments({
    required String supabaseUrl,
    required String supabaseServiceRoleKey,
    required String? cfVersionMetadataId,
    required String? cfVersionMetadataTag,
    required String? cfVersionMetadataTimestamp,
    required String postgresUrl,
    required String internalApiUrl,
    required String xApiKey,
    required String logoBaseUrl,
    required String cloudflareAccountId,
    required String r2BucketName,
    required String r2AccessKeyId,
    required String r2SecretAccessKey,
    required String websocketJwtSecretBase64,
  }) = _Environments;

  const Environments._();

  factory Environments.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentsFromJson(json);

  /// ローカル環境かどうか
  bool get isLocal => cfVersionMetadataId == 'local';
}
