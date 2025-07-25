// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'db_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(dbClient)
const dbClientProvider = DbClientProvider._();

final class DbClientProvider
    extends
        $FunctionalProvider<AsyncValue<DbClient>, DbClient, FutureOr<DbClient>>
    with $FutureModifier<DbClient>, $FutureProvider<DbClient> {
  const DbClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dbClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dbClientHash();

  @$internal
  @override
  $FutureProviderElement<DbClient> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<DbClient> create(Ref ref) {
    return dbClient(ref);
  }
}

String _$dbClientHash() => r'ae3e9da94f42e7b01c74d1f5dca3c4cc24622039';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
