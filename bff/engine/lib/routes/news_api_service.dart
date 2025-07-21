import 'dart:convert';
import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/exception_handler.dart';
import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'news_api_service.g.dart';

class NewsApiService {
  /// 公開中のニュース一覧を取得します
  @Route.get('/news')
  Future<Response> _getPublishedNewsList(Request request) async => jsonResponse(
    () async {
      final database = await container.read(dbClientProvider.future);
      final newsList = await database.news.getPublishedNewsList();

      return NewsListResponse(news: newsList).toJson();
    },
  );

  /// 管理者向け：全てのニュース一覧を取得します（未公開含む）
  @Route.get('/news/admin')
  Future<Response> _getAllNewsList(Request request) async => jsonResponse(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, _, roles) = userResult.unwrap;

      // 管理者権限チェック
      if (!roles.contains(Role.admin)) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.forbidden,
          detail: 'この操作には管理者権限が必要です',
        );
      }

      final database = await container.read(dbClientProvider.future);
      final newsList = await database.news.getAllNewsList();

      return NewsListResponse(news: newsList).toJson();
    },
  );

  /// 特定のニュースを取得します
  @Route.get('/news/<id>')
  Future<Response> _getNews(Request request, String id) async => jsonResponse(
    () async {
      final newsId = int.tryParse(id);
      if (newsId == null) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.badRequest,
          detail: '無効なニュースIDです',
        );
      }

      final database = await container.read(dbClientProvider.future);
      final news = await database.news.getNewsById(newsId);

      if (news == null) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.notFound,
          detail: 'ニュースが見つかりません',
        );
      }

      return news.toJson();
    },
  );

  /// ニュースを作成します
  @Route.post('/news')
  Future<Response> _createNews(Request request) async => jsonResponse(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, _, roles) = userResult.unwrap;

      // 管理者権限チェック
      if (!roles.contains(Role.admin)) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.forbidden,
          detail: 'この操作には管理者権限が必要です',
        );
      }

      final body = await request.readAsString();
      final requestData = NewsCreateRequest.fromJson(
        jsonDecode(body) as Map<String, dynamic>,
      );

      final database = await container.read(dbClientProvider.future);
      final news = await database.news.createNews(
        title: requestData.title,
        url: requestData.url,
        startsAt: requestData.startsAt,
        endsAt: requestData.endsAt,
      );

      return news.toJson();
    },
  );

  /// ニュースを更新します
  @Route.put('/news/<id>')
  Future<Response> _updateNews(Request request, String id) async => jsonResponse(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, _, roles) = userResult.unwrap;

      // 管理者権限チェック
      if (!roles.contains(Role.admin)) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.forbidden,
          detail: 'この操作には管理者権限が必要です',
        );
      }

      final newsId = int.tryParse(id);
      if (newsId == null) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.badRequest,
          detail: '無効なニュースIDです',
        );
      }

      final body = await request.readAsString();
      final requestData = NewsUpdateRequest.fromJson(
        jsonDecode(body) as Map<String, dynamic>,
      );

      final database = await container.read(dbClientProvider.future);
      final news = await database.news.updateNews(
        id: newsId,
        title: requestData.title,
        url: requestData.url,
        startsAt: requestData.startsAt,
        endsAt: requestData.endsAt,
      );

      if (news == null) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.notFound,
          detail: 'ニュースが見つかりません',
        );
      }

      return news.toJson();
    },
  );

  /// ニュースを削除します
  @Route.delete('/news/<id>')
  Future<Response> _deleteNews(Request request, String id) async => jsonResponse(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, _, roles) = userResult.unwrap;

      // 管理者権限チェック
      if (!roles.contains(Role.admin)) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.forbidden,
          detail: 'この操作には管理者権限が必要です',
        );
      }

      final newsId = int.tryParse(id);
      if (newsId == null) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.badRequest,
          detail: '無効なニュースIDです',
        );
      }

      final database = await container.read(dbClientProvider.future);
      final deleted = await database.news.deleteNews(newsId);

      if (!deleted) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.notFound,
          detail: 'ニュースが見つかりません',
        );
      }

      return <String, dynamic>{
        'success': true,
        'message': 'ニュースが削除されました',
      };
    },
  );

  Router get router => _$NewsApiServiceRouter(this);
}