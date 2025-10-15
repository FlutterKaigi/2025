// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'news_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$newsHash() => r'67407a1de612f74858ba17ce8e7ab294b2d8323a';
