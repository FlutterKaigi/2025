// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'news_api_service.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$NewsApiServiceRouter(NewsApiService service) {
  final router = Router();
  router.add('GET', r'/news', service._getPublishedNewsList);
  router.add('GET', r'/news/admin', service._getAllNewsList);
  router.add('GET', r'/news/<id>', service._getNews);
  router.add('POST', r'/news', service._createNews);
  router.add('PUT', r'/news/<id>', service._updateNews);
  router.add('DELETE', r'/news/<id>', service._deleteNews);
  return router;
}
