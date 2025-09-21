import 'dart:io';

import 'package:engine/provider/environments_provider.dart';
import 'package:engine/routes/api_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

// ignore: unreachable_from_main
final ProviderContainer container = ProviderContainer();

Future<void> main() async {
  print('Starting server...');

  final apiService = ApiService();
  final pipeline = const Pipeline().addMiddleware(logRequests());

  final Handler handler;
  if (container.read(
    environmentsProvider.select((e) => e.isLocal),
  )) {
    // ローカル環境の場合は `http://localhost:3000` からのリクエストを許可
    handler = pipeline
        .addMiddleware(
          corsHeaders(
            originChecker: (origin) => origin == 'http://localhost:3000',
          ),
        )
        .addHandler(apiService.handler);
  } else {
    handler = pipeline.addHandler(apiService.handler);
  }

  final server = await shelf_io.serve(
    handler,
    InternetAddress.anyIPv4,
    8080,
  );

  print('Server listening on port ${server.port}');
}
