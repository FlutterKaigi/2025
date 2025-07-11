import 'dart:async';
import 'dart:io';

import 'package:dashboard/features/auth/data/notifier/auth_notifier.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bff_authorization_header_interceptor.g.dart';

@Riverpod(keepAlive: true)
BffAuthorizationHeaderInterceptor bffAuthorizationHeaderInterceptor(Ref ref) {
  return BffAuthorizationHeaderInterceptor(
    getAccessToken: () async =>
        ref.read(authNotifierProvider.notifier).getAccessToken(),
  );
}

class BffAuthorizationHeaderInterceptor extends Interceptor {
  BffAuthorizationHeaderInterceptor({required this.getAccessToken});

  final Future<String?> Function() getAccessToken;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    unawaited(() async {
      final accessToken = await getAccessToken();
      if (accessToken != null) {
        options.headers[HttpHeaders.authorizationHeader] =
            'Bearer $accessToken';
      }
      super.onRequest(options, handler);
    }());
  }
}
