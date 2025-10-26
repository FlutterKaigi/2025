import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:engine/provider/environments_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'jwt_secret_provider.g.dart';

@Riverpod(keepAlive: true)
JWTKey jwtSecret(Ref ref) {
  final encodedPem = ref.watch(
    environmentsProvider.select((env) => env.websocketJwtSecretBase64),
  );
  final decodedPem = utf8.decoder.convert(
    base64Decode(encodedPem),
  );
  return ECPrivateKey(decodedPem);
}
