import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_upload_dio.g.dart';

@Riverpod(keepAlive: true)
Dio fileUploadDio(Ref ref) => Dio(
  BaseOptions(
    contentType: ContentType.json.mimeType,
  ),
);
