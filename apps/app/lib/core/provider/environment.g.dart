// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'environment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Environment _$EnvironmentFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Environment',
  json,
  ($checkedConvert) {
    final val = _Environment(
      appIdSuffix: $checkedConvert('app_id_suffix', (v) => v as String),
      appName: $checkedConvert('app_name', (v) => v as String),
      flavor: $checkedConvert('flavor', (v) => $enumDecode(_$FlavorEnumMap, v)),
      supabaseUrl: $checkedConvert('supabase_url', (v) => v as String),
      supabaseKey: $checkedConvert('supabase_key', (v) => v as String),
      bffBaseUrl: $checkedConvert('bff_base_url', (v) => v as String),
      withdrawalFormUrl: $checkedConvert(
        'withdrawal_form_url',
        (v) => v as String,
      ),
      commitInformation: $checkedConvert(
        'commit_information',
        (v) => v as String?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'appIdSuffix': 'app_id_suffix',
    'appName': 'app_name',
    'supabaseUrl': 'supabase_url',
    'supabaseKey': 'supabase_key',
    'bffBaseUrl': 'bff_base_url',
    'withdrawalFormUrl': 'withdrawal_form_url',
    'commitInformation': 'commit_information',
  },
);

Map<String, dynamic> _$EnvironmentToJson(_Environment instance) =>
    <String, dynamic>{
      'app_id_suffix': instance.appIdSuffix,
      'app_name': instance.appName,
      'flavor': _$FlavorEnumMap[instance.flavor]!,
      'supabase_url': instance.supabaseUrl,
      'supabase_key': instance.supabaseKey,
      'bff_base_url': instance.bffBaseUrl,
      'withdrawal_form_url': instance.withdrawalFormUrl,
      'commit_information': instance.commitInformation,
    };

const _$FlavorEnumMap = {
  Flavor.production: 'production',
  Flavor.staging: 'staging',
  Flavor.develop: 'develop',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(environment)
const environmentProvider = EnvironmentProvider._();

final class EnvironmentProvider
    extends $FunctionalProvider<Environment, Environment, Environment>
    with $Provider<Environment> {
  const EnvironmentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'environmentProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$environmentHash();

  @$internal
  @override
  $ProviderElement<Environment> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Environment create(Ref ref) {
    return environment(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Environment value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Environment>(value),
    );
  }
}

String _$environmentHash() => r'eaecc2d26f9e24d09890f13ed63c1edb0a92a7a9';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
