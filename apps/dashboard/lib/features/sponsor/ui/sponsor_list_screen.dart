import 'package:dashboard/core/router/router.dart';
import 'package:flutter/material.dart';

/// スポンサー一覧画面
///
/// 主な役割:
/// - スポンサー企業の一覧を表示する
/// - 詳細画面や編集画面への導線を提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class SponsorListScreen extends StatelessWidget {
  const SponsorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () =>
              const SponsorDetailRoute(slug: 'sample-sponsor').go(context),
          child: const Text('スポンサー詳細へ'),
        ),
      ),
    );
  }
}
