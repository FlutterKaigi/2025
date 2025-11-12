import 'dart:io';

import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'app_version_api_service.g.dart';

class AppVersionApiService {
  @Route.get('/version')
  Future<Response> checkVersion(Request request) async {
    return jsonResponse(
      () async => {
        'minimum_version': {
          'ios': Platform.environment['APP_MIN_VERSION_IOS'] ?? '1.2.0',
          'android': Platform.environment['APP_MIN_VERSION_ANDROID'] ?? '1.2.0',
        },
        'store_urls': {
          'ios': 'https://apps.apple.com/us/app/flutterkaigi-2025/id6753943930',
          'android':
              'https://play.google.com/store/apps/details?id=jp.flutterkaigi.conf2025',
        },
        'message': {
          'ja': 'このアプリを使うには最新のバージョンにアップデートしてください。',
          'en': 'To use this app, please update to the latest version.',
        },
      },
    );
  }

  Router get router => _$AppVersionApiServiceRouter(this);
}
