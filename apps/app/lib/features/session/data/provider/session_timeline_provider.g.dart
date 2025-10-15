// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'session_timeline_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$sessionTimelineHash() => r'eaf271501d230d824c6f795e3833d2fe73739717';

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
    r'0645d4a1807af3afb79f0e9208e88b7c66f70313';

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

@ProviderFor(sessionEvents)
const sessionEventsProvider = SessionEventsProvider._();

final class SessionEventsProvider
    extends
        $FunctionalProvider<
          List<TimelineEvent>,
          List<TimelineEvent>,
          List<TimelineEvent>
        >
    with $Provider<List<TimelineEvent>> {
  const SessionEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionEventsHash();

  @$internal
  @override
  $ProviderElement<List<TimelineEvent>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<TimelineEvent> create(Ref ref) {
    return sessionEvents(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TimelineEvent> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TimelineEvent>>(value),
    );
  }
}

String _$sessionEventsHash() => r'f8550d81605096b812bf33b81e384afe9b0caf36';
