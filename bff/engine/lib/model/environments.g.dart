// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'environments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Environments _$EnvironmentsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_Environments',
      json,
      ($checkedConvert) {
        final val = _Environments(
          supabaseUrl: $checkedConvert('SUPABASE_URL', (v) => v as String),
          supabaseServiceRoleKey: $checkedConvert(
            'SUPABASE_SERVICE_ROLE_KEY',
            (v) => v as String,
          ),
          cfVersionMetadataId: $checkedConvert(
            'CF_VERSION_METADATA_ID',
            (v) => v as String,
          ),
          cfVersionMetadataTag: $checkedConvert(
            'CF_VERSION_METADATA_TAG',
            (v) => v as String,
          ),
          cfVersionMetadataTimestamp: $checkedConvert(
            'CF_VERSION_METADATA_TIMESTAMP',
            (v) => v as String,
          ),
          postgresUrl: $checkedConvert('POSTGRES_URL', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'supabaseUrl': 'SUPABASE_URL',
        'supabaseServiceRoleKey': 'SUPABASE_SERVICE_ROLE_KEY',
        'cfVersionMetadataId': 'CF_VERSION_METADATA_ID',
        'cfVersionMetadataTag': 'CF_VERSION_METADATA_TAG',
        'cfVersionMetadataTimestamp': 'CF_VERSION_METADATA_TIMESTAMP',
        'postgresUrl': 'POSTGRES_URL',
      },
    );

Map<String, dynamic> _$EnvironmentsToJson(_Environments instance) =>
    <String, dynamic>{
      'SUPABASE_URL': instance.supabaseUrl,
      'SUPABASE_SERVICE_ROLE_KEY': instance.supabaseServiceRoleKey,
      'CF_VERSION_METADATA_ID': instance.cfVersionMetadataId,
      'CF_VERSION_METADATA_TAG': instance.cfVersionMetadataTag,
      'CF_VERSION_METADATA_TIMESTAMP': instance.cfVersionMetadataTimestamp,
      'POSTGRES_URL': instance.postgresUrl,
    };
