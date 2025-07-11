import 'package:freezed_annotation/freezed_annotation.dart';

part 'environments.freezed.dart';
part 'environments.g.dart';

@Freezed()
abstract class Environments with _$Environments {
  @JsonSerializable(fieldRename: FieldRename.screamingSnake)
  const factory Environments({
    required String supabaseUrl,
    required String supabaseServiceRoleKey,
    required String cfVersionMetadataId,
    required String cfVersionMetadataTag,
    required String cfVersionMetadataTimestamp,
    required String postgresUrl,
  }) = _Environments;

  factory Environments.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentsFromJson(json);
}
