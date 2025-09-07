import 'dart:io';

import 'package:engine/model/environments.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'environments_provider.g.dart';

@Riverpod(keepAlive: true)
Environments environments(Ref ref) {
  return Environments.fromJson(Platform.environment);
}
