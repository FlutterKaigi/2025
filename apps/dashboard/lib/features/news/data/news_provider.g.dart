// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'news_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(news)
const newsProvider = NewsProvider._();

final class NewsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<News>>,
          List<News>,
          FutureOr<List<News>>
        >
    with $FutureModifier<List<News>>, $FutureProvider<List<News>> {
  const NewsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newsHash();

  @$internal
  @override
  $FutureProviderElement<List<News>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<News>> create(Ref ref) {
    return news(ref);
  }
}

String _$newsHash() => r'720ee973eb29c5b0524c6cb5d8f6fef7d4c83e79';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
