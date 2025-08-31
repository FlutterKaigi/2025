import 'package:flutter/material.dart';

/// 招待コード入力画面
///
/// 主な役割:
/// - 新規ユーザーが招待コードを入力する
/// - ドメイン一致確認やアカウント作成処理への導線を提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/app/SCREENS.md)
class InvitationCodeScreen extends StatelessWidget {
  const InvitationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('InvitationCodeScreen')));
  }
}
