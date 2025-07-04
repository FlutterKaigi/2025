// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'FlutterKaigi 2025 Dashboard';

  @override
  String get notificationTileTitle => '最新のお知らせ';

  @override
  String get notificationTileSubtitle => '最新のお知らせをご確認ください';

  @override
  String get eventDescription =>
      '2025年、日本国内で Flutter をメインに扱う技術カンファレンス。Flutter や Dart の深い知見を持つ開発者によるセッションを多数企画します。';

  @override
  String get eventDate => '2025年11月13日(金)';

  @override
  String get eventTime => '10:00 ~ 18:00';

  @override
  String get eventVenue => '大手町プレイス ホール＆カンファレンス';

  @override
  String get eventAddress => '東京都千代田区大手町二丁目3番1号';
}
