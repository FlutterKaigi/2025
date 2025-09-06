import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'app_version_api_service.g.dart';

class AppVersionApiService {
  @Route.get('/version')
  Future<Response> checkVersion(Request request) async {
    final config = await _getVersionConfig();

    return jsonResponse(
      () async => {
        'result': {
          'minimum_version': config['minimum_version'],
          'store_urls': {
            'ios': config['ios_store_url'],
            'android': config['android_store_url'],
          },
          'message': config['message'],
        },
      },
    );
  }

  Future<Map<String, dynamic>> _getVersionConfig() async {
    return {
      'minimum_version': '1.0.0',
      'ios_store_url': 'https://apps.apple.com/jp/app/flutterkaigi/id...',
      'android_store_url':
          'https://play.google.com/store/apps/details?id=jp.flutterkaigi',
      'message': {
        'ja': 'アプリをアップデートしてください',
        'en': 'Please update your app',
      },
    };
  }

  Router get router => _$AppVersionApiServiceRouter(this);
}
