import 'dart:io';

import 'package:engine/routes/api_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

Future<void> main() async {
  print('Starting server...');

  final apiService = ApiService();

  final handler = const Pipeline().addHandler(apiService.handler);

  final server = await shelf_io.serve(
    handler,
    InternetAddress.anyIPv4,
    8080,
  );

  print('Server listening on port ${server.port}');
}
