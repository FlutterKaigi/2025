import 'package:flutter/material.dart';

/// スポンサー詳細画面
///
/// 主な役割:
/// - スポンサー企業の詳細情報を表示する
/// - 編集画面への導線を提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class SponsorDetailScreen extends StatelessWidget {
  const SponsorDetailScreen({required this.slug, super.key});
  final String slug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'SponsorDetailScreen: slug = '
          '[1m$slug[0m',
        ),
      ),
    );
  }
}
