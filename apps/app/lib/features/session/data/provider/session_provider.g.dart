// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sessionSchedule)
const sessionScheduleProvider = SessionScheduleProvider._();

final class SessionScheduleProvider
    extends
        $FunctionalProvider<
          AsyncValue<SessionScheduleResponse>,
          SessionScheduleResponse,
          FutureOr<SessionScheduleResponse>
        >
    with
        $FutureModifier<SessionScheduleResponse>,
        $FutureProvider<SessionScheduleResponse> {
  const SessionScheduleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionScheduleProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionScheduleHash();

  @$internal
  @override
  $FutureProviderElement<SessionScheduleResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SessionScheduleResponse> create(Ref ref) {
    return sessionSchedule(ref);
  }
}

String _$sessionScheduleHash() => r'b69379aa8ea265e4aa985306171e3049a554d366';

@ProviderFor(sessions)
const sessionsProvider = SessionsProvider._();

final class SessionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Session>>,
          List<Session>,
          FutureOr<List<Session>>
        >
    with $FutureModifier<List<Session>>, $FutureProvider<List<Session>> {
  const SessionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionsHash();

  @$internal
  @override
  $FutureProviderElement<List<Session>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Session>> create(Ref ref) {
    return sessions(ref);
  }
}

String _$sessionsHash() => r'76d7e21104631416283b8807f567f1380f7db89d';

@ProviderFor(venuesWithSessions)
const venuesWithSessionsProvider = VenuesWithSessionsProvider._();

final class VenuesWithSessionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<VenueWithSessions>>,
          List<VenueWithSessions>,
          FutureOr<List<VenueWithSessions>>
        >
    with
        $FutureModifier<List<VenueWithSessions>>,
        $FutureProvider<List<VenueWithSessions>> {
  const VenuesWithSessionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'venuesWithSessionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$venuesWithSessionsHash();

  @$internal
  @override
  $FutureProviderElement<List<VenueWithSessions>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<VenueWithSessions>> create(Ref ref) {
    return venuesWithSessions(ref);
  }
}

String _$venuesWithSessionsHash() =>
    r'a3089e4320edbbf22a780dd4b974f61e7ad9b825';

@ProviderFor(sessionEvents)
const sessionEventsProvider = SessionEventsProvider._();

final class SessionEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TimelineEvent>>,
          List<TimelineEvent>,
          FutureOr<List<TimelineEvent>>
        >
    with
        $FutureModifier<List<TimelineEvent>>,
        $FutureProvider<List<TimelineEvent>> {
  const SessionEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionEventsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionEventsHash();

  @$internal
  @override
  $FutureProviderElement<List<TimelineEvent>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TimelineEvent>> create(Ref ref) {
    return sessionEvents(ref);
  }
}

String _$sessionEventsHash() => r'5e041fb9e037dc1fb6c718ef38035328b6cfadfa';
