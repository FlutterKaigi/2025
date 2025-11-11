// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'bookmarked_sessions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BookmarkedSessions)
const bookmarkedSessionsProvider = BookmarkedSessionsProvider._();

final class BookmarkedSessionsProvider
    extends $AsyncNotifierProvider<BookmarkedSessions, Set<String>> {
  const BookmarkedSessionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarkedSessionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarkedSessionsHash();

  @$internal
  @override
  BookmarkedSessions create() => BookmarkedSessions();
}

String _$bookmarkedSessionsHash() =>
    r'4bf0b4e03d23297f14e4cbedc1cd12f37eefb54f';

abstract class _$BookmarkedSessions extends $AsyncNotifier<Set<String>> {
  FutureOr<Set<String>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Set<String>>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Set<String>>, Set<String>>,
              AsyncValue<Set<String>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
