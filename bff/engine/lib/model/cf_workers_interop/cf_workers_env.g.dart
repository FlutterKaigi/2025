// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'cf_workers_env.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CfWorkersEnv _$CfWorkersEnvFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CfWorkersEnv',
      json,
      ($checkedConvert) {
        final val = _CfWorkersEnv(
          commitHash: $checkedConvert('commit_hash', (v) => v as String),
          supabaseUrl: $checkedConvert('supabase_url', (v) => v as String),
          supabaseServiceRoleKey: $checkedConvert(
            'supabase_service_role_key',
            (v) => v as String,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'commitHash': 'commit_hash',
        'supabaseUrl': 'supabase_url',
        'supabaseServiceRoleKey': 'supabase_service_role_key',
      },
    );

Map<String, dynamic> _$CfWorkersEnvToJson(_CfWorkersEnv instance) =>
    <String, dynamic>{
      'commit_hash': instance.commitHash,
      'supabase_url': instance.supabaseUrl,
      'supabase_service_role_key': instance.supabaseServiceRoleKey,
    };
