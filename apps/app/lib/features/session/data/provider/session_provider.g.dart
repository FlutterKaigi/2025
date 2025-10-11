// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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

@ProviderFor(sessionVenues)
const sessionVenuesProvider = SessionVenuesProvider._();

final class SessionVenuesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Venue>>,
          List<Venue>,
          FutureOr<List<Venue>>
        >
    with $FutureModifier<List<Venue>>, $FutureProvider<List<Venue>> {
  const SessionVenuesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionVenuesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionVenuesHash();

  @$internal
  @override
  $FutureProviderElement<List<Venue>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Venue>> create(Ref ref) {
    return sessionVenues(ref);
  }
}

String _$sessionVenuesHash() => r'9990a919ffcb716b80a8eb4db220b063f55ced3e';

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

String _$sessionEventsHash() => r'bc35e55f084de78dbdc55e8421b8ef195eba6703';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
