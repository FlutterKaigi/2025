import 'package:bff_client/bff_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_client.g.dart';

@RestApi()
abstract class NewsApiClient {
  factory NewsApiClient(Dio dio, {String baseUrl}) = _NewsApiClient;

  /// 公開中のニュース一覧を取得します
  @GET('/news')
  Future<HttpResponse<NewsListResponse>> getPublishedNewsList();

  /// 管理者向け：全てのニュース一覧を取得します（未公開含む）
  /// Authorization Headerが必須（管理者権限が必要）
  @GET('/news/admin')
  Future<HttpResponse<NewsListResponse>> getAllNewsList();

  /// 特定のニュースを取得します
  @GET('/news/{id}')
  Future<HttpResponse<News>> getNews({
    @Path() required int id,
  });

  /// ニュースを作成します
  /// Authorization Headerが必須（管理者権限が必要）
  @POST('/news')
  Future<HttpResponse<News>> createNews({
    @Body() required NewsCreateRequest request,
  });

  /// ニュースを更新します
  /// Authorization Headerが必須（管理者権限が必要）
  @PUT('/news/{id}')
  Future<HttpResponse<News>> updateNews({
    @Path() required int id,
    @Body() required NewsUpdateRequest request,
  });

  /// ニュースを削除します
  /// Authorization Headerが必須（管理者権限が必要）
  @DELETE('/news/{id}')
  Future<HttpResponse<void>> deleteNews({
    @Path() required int id,
  });
}
