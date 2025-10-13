// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:app/core/provider/environment.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_auth_client_id.g.dart';

@riverpod
String googleAuthClientId(Ref ref) {
  final flavor = ref.watch(environmentProvider).flavor;

  final webClientId = ref.watch(googleAuthWebClientIdProvider);

  return switch (flavor) {
    _ when kIsWeb  => webClientId,
    Flavor.develop when Platform.isAndroid =>
      '106402217021-8b4egl8ss9v3jroesh8qbp7ttb6nhuin.apps.googleusercontent.com',
    Flavor.develop when Platform.isIOS || Platform.isMacOS =>
      '106402217021-unfbr2053d3i4g0bfb7ffsh212he42g5.apps.googleusercontent.com',
    Flavor.staging when Platform.isAndroid =>
      '106402217021-vh89gtse68749q1rbae8m6hpr72vd49n.apps.googleusercontent.com',
    Flavor.staging when Platform.isIOS || Platform.isMacOS =>
      '106402217021-puvr9tm2b1kgia7t3ba3p9l151dltq0m.apps.googleusercontent.com',
    Flavor.production when Platform.isAndroid =>
      '106402217021-75arqu0p7nc927fgku5uuh06s3pvlhsr.apps.googleusercontent.com',
    Flavor.production when Platform.isIOS || Platform.isMacOS =>
      '106402217021-ql2va8nvujbqigkdqmoiiu4v0sgjbf4u.apps.googleusercontent.com',
    _ => throw UnimplementedError(
      'Unsupported device platform: $defaultTargetPlatform',
    ),
  };
}


@riverpod
 String googleAuthWebClientId(Ref ref) => '106402217021-p95ju7d3noudgv25snerp3qg1usgm7mv.apps.googleusercontent.com';
