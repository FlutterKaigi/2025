import 'dart:async';

import 'package:app/core/gen/l10n/l10n.dart';
import 'package:app/features/news/data/news.dart';
import 'package:app/features/news/data/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

/// お知らせ画面
///
/// 主な役割:
/// - イベントや運営からのお知らせ情報を表示する
/// - イベント画面などから遷移して利用される
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.newsScreenTitle),
      ),
      body: const _NewsList(),
    );
  }
}

class _NewsList extends ConsumerWidget {
  const _NewsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsProvider);
    final l10n = L10n.of(context);
    return switch (news) {
      AsyncData(:final value) =>
        value.isEmpty
            ? Center(
                child: Text(l10n.newsEmptyMessage),
              )
            : ListView.separated(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final news = value[index];
                  return _NewsListItem(news: news);
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 1,
                  );
                },
              ),
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError(:final error) => Center(child: Text(error.toString())),
    };
  }
}

final _dateFormatter = DateFormat.yMMMMd('ja_JP');

class _NewsListItem extends StatelessWidget {
  const _NewsListItem({required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(news.title),
      subtitle: Text(_dateFormatter.format(news.startedAt)),
      trailing: news.url != null ? const Icon(Icons.open_in_new) : null,
      onTap: news.url != null
          ? () {
              unawaited(
                launchUrl(
                  news.url!,
                  mode: LaunchMode.externalApplication,
                ),
              );
            }
          : null,
    );
  }
}
