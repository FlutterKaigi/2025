// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'supabase_util.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(supabaseUtil)
const supabaseUtilProvider = SupabaseUtilProvider._();

final class SupabaseUtilProvider
    extends $FunctionalProvider<SupabaseUtil, SupabaseUtil>
    with $Provider<SupabaseUtil> {
  const SupabaseUtilProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseUtilProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseUtilHash();

  @$internal
  @override
  $ProviderElement<SupabaseUtil> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SupabaseUtil create(Ref ref) {
    return supabaseUtil(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseUtil value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<SupabaseUtil>(value),
    );
  }
}

String _$supabaseUtilHash() => r'ab4b3c58f33f5db630f943c5f094cc65798fe427';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
