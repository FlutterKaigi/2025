// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'db_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$dbClientHash() => r'3bb4332abfce2645a61a6b72410faf8fc73dadb4';
