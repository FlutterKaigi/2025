// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'tick_stream_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tickStream)
const tickStreamProvider = TickStreamFamily._();

final class TickStreamProvider
    extends
        $FunctionalProvider<AsyncValue<DateTime>, DateTime, Stream<DateTime>>
    with $FutureModifier<DateTime>, $StreamProvider<DateTime> {
  const TickStreamProvider._({
    required TickStreamFamily super.from,
    required ({Duration duration, TickMode mode}) super.argument,
  }) : super(
         retry: null,
         name: r'tickStreamProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tickStreamHash();

  @override
  String toString() {
    return r'tickStreamProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<DateTime> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<DateTime> create(Ref ref) {
    final argument = this.argument as ({Duration duration, TickMode mode});
    return tickStream(ref, duration: argument.duration, mode: argument.mode);
  }

  @override
  bool operator ==(Object other) {
    return other is TickStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tickStreamHash() => r'78d619115b606c6a734f30408e947dfab8b200ba';

final class TickStreamFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<DateTime>,
          ({Duration duration, TickMode mode})
        > {
  const TickStreamFamily._()
    : super(
        retry: null,
        name: r'tickStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TickStreamProvider call({
    required Duration duration,
    required TickMode mode,
  }) => TickStreamProvider._(
    argument: (duration: duration, mode: mode),
    from: this,
  );

  @override
  String toString() => r'tickStreamProvider';
}
