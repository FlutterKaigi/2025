// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'sponsor_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$sponsorsHash() => r'ddd7ee4e5054931b3190501cf317732ed3a6df65';
