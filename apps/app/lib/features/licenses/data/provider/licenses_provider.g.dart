// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'licenses_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(licenses)
const licensesProvider = LicensesProvider._();

final class LicensesProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, List<List<LicenseParagraph>>>>,
          Map<String, List<List<LicenseParagraph>>>,
          FutureOr<Map<String, List<List<LicenseParagraph>>>>
        >
    with
        $FutureModifier<Map<String, List<List<LicenseParagraph>>>>,
        $FutureProvider<Map<String, List<List<LicenseParagraph>>>> {
  const LicensesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'licensesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$licensesHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, List<List<LicenseParagraph>>>>
  $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, List<List<LicenseParagraph>>>> create(Ref ref) {
    return licenses(ref);
  }
}

String _$licensesHash() => r'0977b57f1bd8163614e371ec7cb6410b94b3e272';
