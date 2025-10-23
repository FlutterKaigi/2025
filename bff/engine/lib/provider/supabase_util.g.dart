// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'supabase_util.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(supabaseUtil)
const supabaseUtilProvider = SupabaseUtilProvider._();

final class SupabaseUtilProvider
    extends $FunctionalProvider<SupabaseUtil, SupabaseUtil, SupabaseUtil>
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
      providerOverride: $SyncValueProvider<SupabaseUtil>(value),
    );
  }
}

String _$supabaseUtilHash() => r'6ea7bd55ed65e16c8fe71f901aba633385bb9933';
