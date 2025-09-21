// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
        isAutoDispose: true,
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

String _$sessionsHash() => r'fd3add758feb259eec5563fadc583f7aeb668347';

@ProviderFor(sessionVenues)
const sessionVenuesProvider = SessionVenuesProvider._();

final class SessionVenuesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SessionVenue>>,
          List<SessionVenue>,
          FutureOr<List<SessionVenue>>
        >
    with
        $FutureModifier<List<SessionVenue>>,
        $FutureProvider<List<SessionVenue>> {
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
  $FutureProviderElement<List<SessionVenue>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SessionVenue>> create(Ref ref) {
    return sessionVenues(ref);
  }
}

String _$sessionVenuesHash() => r'4394a641ce75f0175833bb80983cb2f0357d13ef';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
