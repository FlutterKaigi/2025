import 'package:engine/util/fetch_http_client.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_api_http_client.g.dart';

@Riverpod(keepAlive: true)
FetchApiHttpClient fetchApiHttpClient(Ref ref) =>
    throw UnimplementedError('ProviderContainerからoverrideしてください');
