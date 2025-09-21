// ignore_for_file: avoid_classes_with_only_static_members

import 'package:app/features/session/data/model/session.dart';

class MockSessions {
  static final List<SessionVenue> _venues = [
    const SessionVenue(id: 'venue1', name: 'メインホール'),
    const SessionVenue(id: 'venue2', name: 'ホール A'),
    const SessionVenue(id: 'venue3', name: 'ホール B'),
    const SessionVenue(id: 'venue4', name: 'ホール C'),
  ];

  static final List<Speaker> _speakers = [
    Speaker(
      id: 'speaker1',
      name: '田中 太郎',
      bio: 'Flutterエンジニア。Google Developer Expert。',
      xUrl: Uri.parse('https://x.com/tanaka_taro'),
    ),
    Speaker(
      id: 'speaker2',
      name: '佐藤 花子',
      bio: 'モバイルアプリ開発者。UI/UX専門。',
      xUrl: Uri.parse('https://x.com/sato_hanako'),
    ),
    Speaker(
      id: 'speaker3',
      name: '山田 次郎',
      bio: 'フロントエンドエンジニア。Flutter Web推進者。',
      xUrl: Uri.parse('https://x.com/yamada_jiro'),
    ),
    const Speaker(
      id: 'speaker4',
      name: '鈴木 三郎',
      bio: 'バックエンドエンジニア。API設計専門。',
    ),
    Speaker(
      id: 'speaker5',
      name: '高橋 美咲',
      bio: 'DevOpsエンジニア。CI/CD専門。',
      xUrl: Uri.parse('https://x.com/takahashi_misaki'),
    ),
    Speaker(
      id: 'speaker6',
      name: '伊藤 健',
      bio: 'テスティングエンジニア。QA専門。',
      xUrl: Uri.parse('https://x.com/ito_ken'),
    ),
    Speaker(
      id: 'speaker7',
      name: '渡辺 京子',
      bio: 'AIエンジニア。機械学習専門。',
      xUrl: Uri.parse('https://x.com/watanabe_kyoko'),
    ),
    const Speaker(
      id: 'speaker8',
      name: '中村 正和',
      bio: 'アクセシビリティエンジニア。',
    ),
    Speaker(
      id: 'speaker9',
      name: '小林 修',
      bio: 'モバイルアプリアーキテクト。',
      xUrl: Uri.parse('https://x.com/kobayashi_osamu'),
    ),
    Speaker(
      id: 'speaker10',
      name: '加藤 愛',
      bio: 'UI/UXエンジニア。パフォーマンス専門。',
      xUrl: Uri.parse('https://x.com/kato_ai'),
    ),
  ];

  static final List<Session> _sessions = [
    // 11:00 - 11:15 (Room1, Room2, Room3)
    Session(
      id: 'session1',
      title: 'Riverpodによる状態管理の基礎',
      description: 'Riverpodを使った効率的な状態管理の実装方法について、基本的な概念から実践的な使用例まで幅広く解説します。',
      startsAt: DateTime(2025, 11, 21, 11),
      endsAt: DateTime(2025, 11, 21, 11, 15),
      venue: _venues[0],
      speakers: [_speakers[0]],
      isLightningTalk: false,
      sponsorId: null,
    ),
    Session(
      id: 'session2',
      title: 'FlutterでのAPI統合パターン',
      // ignore: lines_longer_than_80_chars
      description:
          'RESTful APIやGraphQLとの統合における様々なアーキテクチャパターンとベストプラクティスについて説明します。',
      startsAt: DateTime(2025, 11, 21, 11),
      endsAt: DateTime(2025, 11, 21, 11, 15),
      venue: _venues[1],
      speakers: [_speakers[1]],
      isLightningTalk: false,
      sponsorId: null,
    ),
    Session(
      id: 'session3',
      title: 'パフォーマンス最適化テクニック',
      description: 'Flutterアプリのパフォーマンスを向上させるための具体的な最適化手法とデバッグ方法について解説します。',
      startsAt: DateTime(2025, 11, 21, 11),
      endsAt: DateTime(2025, 11, 21, 11, 15),
      venue: _venues[2],
      speakers: [_speakers[2]],
      isLightningTalk: false,
      sponsorId: null,
    ),

    // 11:45 - 12:00 (Room1, Room2スポンサー, Room3, Room4)
    Session(
      id: 'session4',
      title: 'Custom Paintを使った高度なUI実装',
      description:
          'CustomPaintとCustomPainterを使用して、複雑で美しいUIコンポーネントを実装する方法を学びます。',
      startsAt: DateTime(2025, 11, 21, 11, 45),
      endsAt: DateTime(2025, 11, 21, 12),
      venue: _venues[0],
      speakers: [_speakers[2]],
      isLightningTalk: false,
      sponsorId: null,
    ),
    Session(
      id: 'session5',
      title: 'スポンサーセッション：次世代モバイル開発',
      description: 'スポンサー様による最新のモバイル開発トレンドとソリューションのご紹介。',
      startsAt: DateTime(2025, 11, 21, 11, 45),
      endsAt: DateTime(2025, 11, 21, 12),
      venue: _venues[1],
      speakers: [_speakers[3]],
      isLightningTalk: false,
      sponsorId: 1,
    ),
    Session(
      id: 'session6',
      title: 'Flutterアプリのテスト戦略',
      description: 'ユニットテスト、ウィジェットテスト、統合テストを効果的に組み合わせた包括的なテスト戦略について説明します。',
      startsAt: DateTime(2025, 11, 21, 11, 45),
      endsAt: DateTime(2025, 11, 21, 12),
      venue: _venues[2],
      speakers: [_speakers[5]],
      isLightningTalk: false,
      sponsorId: null,
    ),
    Session(
      id: 'session7',
      title: 'マルチプラットフォーム対応の実践',
      description: 'iOS、Android、Web、デスクトップで同一コードベースを使う際のベストプラクティス。',
      startsAt: DateTime(2025, 11, 21, 11, 45),
      endsAt: DateTime(2025, 11, 21, 12),
      venue: _venues[3],
      speakers: [_speakers[8]],
      isLightningTalk: false,
      sponsorId: null,
    ),

    // 13:30 - 14:15 (Room1スポンサー, Room2, Room3ビギナーズLT, Room4ハンズオン)
    Session(
      id: 'session8',
      title: 'スポンサーセッション：DXとモバイル戦略',
      description: 'デジタルトランスフォーメーションにおけるモバイルアプリの役割と戦略について。',
      startsAt: DateTime(2025, 11, 21, 13, 30),
      endsAt: DateTime(2025, 11, 21, 14, 15),
      venue: _venues[0],
      speakers: [_speakers[4]],
      isLightningTalk: false,
      sponsorId: 2,
    ),
    Session(
      id: 'session9',
      title: 'Flutter × Firebase完全ガイド',
      description: 'FirebaseとFlutterを組み合わせたリアルタイムアプリケーション開発。',
      startsAt: DateTime(2025, 11, 21, 13, 30),
      endsAt: DateTime(2025, 11, 21, 14, 15),
      venue: _venues[1],
      speakers: [_speakers[1], _speakers[6]],
      isLightningTalk: false,
      sponsorId: null,
    ),
    Session(
      id: 'session10',
      title: 'ビギナーズLT：初心者向けFlutter Tips',
      description: 'Flutter初心者向けの便利なTipsやよくあるトラブルの解決方法を5分LTで紹介。',
      startsAt: DateTime(2025, 11, 21, 13, 30),
      endsAt: DateTime(2025, 11, 21, 14, 15),
      venue: _venues[2],
      speakers: [_speakers[7], _speakers[9]],
      isLightningTalk: true,
      sponsorId: null,
    ),
    Session(
      id: 'session11',
      title: 'ハンズオンセッション',
      description: 'アプリの魅力を上げるため、UI にアニメーションやデコレーションを追加する基礎知識を学ぶハンズオン',
      startsAt: DateTime(2025, 11, 21, 13, 30),
      endsAt: DateTime(2025, 11, 21, 16),
      venue: _venues[3],
      speakers: List.empty(),
      isLightningTalk: false,
      sponsorId: null,
    ),

    // 14:15 - 15:15 (Room1, Room2スポンサー, Room3)
    Session(
      id: 'session12',
      title: 'Flutter × GraphQL実践',
      description: 'GraphQLとFlutterを組み合わせた効率的なデータ取得戦略の実装手法。',
      startsAt: DateTime(2025, 11, 21, 14, 15),
      endsAt: DateTime(2025, 11, 21, 15, 15),
      venue: _venues[0],
      speakers: [_speakers[0], _speakers[3]],
      isLightningTalk: false,
      sponsorId: null,
    ),
    Session(
      id: 'session13',
      title: 'スポンサーセッション：AIとモバイル開発',
      description: 'AI技術をモバイルアプリに統合する最新のソリューションとツール。',
      startsAt: DateTime(2025, 11, 21, 14, 15),
      endsAt: DateTime(2025, 11, 21, 15, 15),
      venue: _venues[1],
      speakers: [_speakers[6]],
      isLightningTalk: false,
      sponsorId: 3,
    ),
    Session(
      id: 'session14',
      title: 'アニメーション実装の極意',
      description: 'Hero AnimationからRive、Lottieまで、美しいアニメーションの実装方法。',
      startsAt: DateTime(2025, 11, 21, 14, 15),
      endsAt: DateTime(2025, 11, 21, 15, 15),
      venue: _venues[2],
      speakers: [_speakers[2], _speakers[9]],
      isLightningTalk: false,
      sponsorId: null,
    ),

    // 15:15 - 16:00 (Room1, Room2, Room3)
    Session(
      id: 'session15',
      title: 'Flutter × ARCore/ARKit',
      description: 'FlutterアプリでAR機能を実装する方法とベストプラクティス。',
      startsAt: DateTime(2025, 11, 21, 15, 15),
      endsAt: DateTime(2025, 11, 21, 16),
      venue: _venues[0],
      speakers: [_speakers[7]],
      isLightningTalk: false,
      sponsorId: null,
    ),
    Session(
      id: 'session16',
      title: 'セキュリティを意識したFlutter開発',
      description: 'モバイルアプリのセキュリティリスクとFlutterでの対策方法。',
      startsAt: DateTime(2025, 11, 21, 15, 15),
      endsAt: DateTime(2025, 11, 21, 16),
      venue: _venues[1],
      speakers: [_speakers[8]],
      isLightningTalk: false,
      sponsorId: null,
    ),
    Session(
      id: 'session17',
      title: 'Flutter × IoT：センサー連携',
      description: 'IoTデバイスとFlutterアプリの連携実装。',
      startsAt: DateTime(2025, 11, 21, 15, 15),
      endsAt: DateTime(2025, 11, 21, 16),
      venue: _venues[2],
      speakers: [_speakers[4], _speakers[5]],
      isLightningTalk: false,
      sponsorId: null,
    ),

    // 16:00 - 16:30 (Room1 LT, Room3 LT)
    Session(
      id: 'session18',
      title: 'LT：Flutter開発効率化ツール5選',
      description: 'Flutter開発をより効率的にする便利なツールやエクステンションの紹介。',
      startsAt: DateTime(2025, 11, 21, 16),
      endsAt: DateTime(2025, 11, 21, 16, 30),
      venue: _venues[0],
      speakers: [_speakers[9]],
      isLightningTalk: true,
      sponsorId: null,
    ),
    Session(
      id: 'session19',
      title: 'LT：デザインシステムとFlutter',
      description: 'デザインシステムをFlutterアプリに実装する際のポイント。',
      startsAt: DateTime(2025, 11, 21, 16),
      endsAt: DateTime(2025, 11, 21, 16, 30),
      venue: _venues[2],
      speakers: [_speakers[1]],
      isLightningTalk: true,
      sponsorId: null,
    ),

    // 16:45 - 17:30 (Room1, Room3, Room4)
    Session(
      id: 'session20',
      title: 'Flutter開発者のためのDart 3.0',
      description: 'Dart 3.0の新機能とFlutter開発における活用方法。',
      startsAt: DateTime(2025, 11, 21, 16, 45),
      endsAt: DateTime(2025, 11, 21, 17, 30),
      venue: _venues[0],
      speakers: [_speakers[0]],
      isLightningTalk: false,
      sponsorId: null,
    ),
    Session(
      id: 'session21',
      title: 'プロダクション環境でのFlutter運用',
      description: 'リリース後の運用、監視、パフォーマンス分析の実践例。',
      startsAt: DateTime(2025, 11, 21, 16, 45),
      endsAt: DateTime(2025, 11, 21, 17, 30),
      venue: _venues[2],
      speakers: [_speakers[5], _speakers[8]],
      isLightningTalk: false,
      sponsorId: null,
    ),
    Session(
      id: 'session22',
      title: 'CI/CDパイプラインの最適化',
      description: 'GitHub ActionsやCodemagicを使ったFlutterアプリのCI/CD構築。',
      startsAt: DateTime(2025, 11, 21, 16, 45),
      endsAt: DateTime(2025, 11, 21, 17, 30),
      venue: _venues[3],
      speakers: [_speakers[4]],
      isLightningTalk: false,
      sponsorId: null,
    ),

    // 17:30 - 18:00 (Room3, Room4 LT)
    Session(
      id: 'session23',
      title: 'アクセシビリティ対応の重要性',
      description: 'Flutterアプリをすべての人に使いやすくするためのアクセシビリティ実装。',
      startsAt: DateTime(2025, 11, 21, 17, 30),
      endsAt: DateTime(2025, 11, 21, 18),
      venue: _venues[2],
      speakers: [_speakers[7]],
      isLightningTalk: false,
      sponsorId: null,
    ),
    Session(
      id: 'session24',
      title: 'LT：コミュニティとFlutter',
      description: 'Flutterコミュニティの活動とオープンソース貢献について。',
      startsAt: DateTime(2025, 11, 21, 17, 30),
      endsAt: DateTime(2025, 11, 21, 18),
      venue: _venues[3],
      speakers: [_speakers[3], _speakers[6]],
      isLightningTalk: true,
      sponsorId: null,
    ),
  ];

  static List<Session> get sessions => _sessions;
  static List<SessionVenue> get venues => _venues;
  static List<Speaker> get speakers => _speakers;

  static List<Session> getSessionsByVenue(String venueId) {
    return _sessions.where((s) => s.venue.id == venueId).toList();
  }
}
