// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'session_timeline_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(sessionTimeline)
const sessionTimelineProvider = SessionTimelineProvider._();

final class SessionTimelineProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TimelineItem>>,
          List<TimelineItem>,
          FutureOr<List<TimelineItem>>
        >
    with
        $FutureModifier<List<TimelineItem>>,
        $FutureProvider<List<TimelineItem>> {
  const SessionTimelineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionTimelineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionTimelineHash();

  @$internal
  @override
  $FutureProviderElement<List<TimelineItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TimelineItem>> create(Ref ref) {
    return sessionTimeline(ref);
  }
}

String _$sessionTimelineHash() => r'b43e6b16432739c36775dffc404e69bb34d5ac0d';

@ProviderFor(sessionTimelineForVenue)
const sessionTimelineForVenueProvider = SessionTimelineForVenueFamily._();

final class SessionTimelineForVenueProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TimelineItem>>,
          List<TimelineItem>,
          FutureOr<List<TimelineItem>>
        >
    with
        $FutureModifier<List<TimelineItem>>,
        $FutureProvider<List<TimelineItem>> {
  const SessionTimelineForVenueProvider._({
    required SessionTimelineForVenueFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sessionTimelineForVenueProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionTimelineForVenueHash();

  @override
  String toString() {
    return r'sessionTimelineForVenueProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<TimelineItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TimelineItem>> create(Ref ref) {
    final argument = this.argument as String;
    return sessionTimelineForVenue(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionTimelineForVenueProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionTimelineForVenueHash() =>
    r'ce93e23adec669cb0b58b31fac9868d11ab2ba0b';

final class SessionTimelineForVenueFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<TimelineItem>>, String> {
  const SessionTimelineForVenueFamily._()
    : super(
        retry: null,
        name: r'sessionTimelineForVenueProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionTimelineForVenueProvider call(String venueId) =>
      SessionTimelineForVenueProvider._(argument: venueId, from: this);

  @override
  String toString() => r'sessionTimelineForVenueProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
