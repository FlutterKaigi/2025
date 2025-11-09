// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'licenses_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(licensesRepository)
const licensesRepositoryProvider = LicensesRepositoryProvider._();

final class LicensesRepositoryProvider
    extends
        $FunctionalProvider<
          LicensesRepository,
          LicensesRepository,
          LicensesRepository
        >
    with $Provider<LicensesRepository> {
  const LicensesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'licensesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$licensesRepositoryHash();

  @$internal
  @override
  $ProviderElement<LicensesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LicensesRepository create(Ref ref) {
    return licensesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LicensesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LicensesRepository>(value),
    );
  }
}

String _$licensesRepositoryHash() =>
    r'd83355e7ae118c532dba3af3bee124b117448660';
