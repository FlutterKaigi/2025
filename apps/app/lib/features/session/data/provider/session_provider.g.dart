// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$sessionsHash() => r'4795c0381f2cd3d09a5e6b383b47561a2d279e69';

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

String _$sessionVenuesHash() => r'bde2bfcc57d00ef820f50a5b9d72e1ae05217741';
