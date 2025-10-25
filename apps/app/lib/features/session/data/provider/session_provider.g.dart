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
        isAutoDispose: true,
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

String _$sessionScheduleHash() => r'bc19685e4680ea9ed809bb50145e181520f330de';

@ProviderFor(sessions)
const sessionsProvider = SessionsProvider._();

final class SessionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ScheduleSession>>,
          List<ScheduleSession>,
          FutureOr<List<ScheduleSession>>
        >
    with
        $FutureModifier<List<ScheduleSession>>,
        $FutureProvider<List<ScheduleSession>> {
  const SessionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionsHash();

  @$internal
  @override
  $FutureProviderElement<List<ScheduleSession>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ScheduleSession>> create(Ref ref) {
    return sessions(ref);
  }
}

String _$sessionsHash() => r'95e37753f9db9c92f138ecfe70432d712a36219b';

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
        isAutoDispose: true,
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
    r'0581909a27d164e1fbf53c7664ecdff685b758ae';

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
        isAutoDispose: true,
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

String _$sessionEventsHash() => r'3ecf6b07b3667530ab6965b248028334f0f72300';
