import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'app_version_api_service.g.dart';

class AppVersionApiService {
  @Route.get('/version')
  Future<Response> checkVersion(Request request) async {
    return jsonResponse(
      () async => {
        'minimum_version': '0.0.1',
        'store_urls': {
          'ios': 'https://apps.apple.com/jp/app/flutterkaigi/id...',
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
