import 'dart:io';

import 'package:app/core/debug/talker.dart';
import 'package:app/core/provider/environment.dart';
import 'package:bff_client/bff_client.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

part 'bff_client.g.dart';

@Riverpod(keepAlive: true)
BffApiClient bffClient(Ref ref) {
  return BffApiClient(
    dio: ref.watch(bffDioProvider),
  );
}

@Riverpod(keepAlive: true)
Dio bffDio(Ref ref) =>
    Dio(
        BaseOptions(
          baseUrl: ref.watch(environmentProvider.select((v) => v.bffBaseUrl)),
          contentType: ContentType.json.mimeType,
        ),
      )
      ..interceptors.addAll([
        TalkerDioLogger(
          talker: talker,
        ),
      ]);
