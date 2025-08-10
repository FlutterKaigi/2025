// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'sponsor_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(sponsors)
const sponsorsProvider = SponsorsProvider._();

final class SponsorsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Sponsor>>,
          List<Sponsor>,
          FutureOr<List<Sponsor>>
        >
    with $FutureModifier<List<Sponsor>>, $FutureProvider<List<Sponsor>> {
  const SponsorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sponsorsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sponsorsHash();

  @$internal
  @override
  $FutureProviderElement<List<Sponsor>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Sponsor>> create(Ref ref) {
    return sponsors(ref);
  }
}

String _$sponsorsHash() => r'59d9bded9c00ccb78842d697911b2fca672f1e97';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
