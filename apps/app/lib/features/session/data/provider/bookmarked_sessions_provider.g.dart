// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'bookmarked_sessions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
    r'329935af0c9cd61b68f8d318a43119bbd2da4b2e';

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
