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

String _$sessionTimelineHash() => r'1ca1f965f5a2fd4a994e24a388c2e3b9746c90d8';

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
    r'8cd183fbe7140aac930bd51ee8e1619e31f56774';

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
