import 'dart:io';

import 'package:engine/model/environments.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'environemnts_provider.g.dart';

@Riverpod(keepAlive: true)
Environments environemnts(Ref ref) =>
    Environments.fromJson(Platform.environment);
