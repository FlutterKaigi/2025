import 'package:dio/dio.dart';
import 'package:engine/provider/environments_provider.dart';
import 'package:internal_api_client/internal_api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'internal_api_client_provider.g.dart';

@Riverpod(keepAlive: true)
InternalApiClient internalApiClient(Ref ref) => InternalApiClient(
  dio: ref.watch(internalApiDioProvider),
);

@Riverpod(keepAlive: true)
Dio internalApiDio(Ref ref) {
  final env = ref.watch(environmentsProvider);
  return Dio(
    BaseOptions(
      baseUrl: env.internalApiUrl,
      headers: {
        'x-api-key': env.xApiKey,
      },
    ),
  );
}
