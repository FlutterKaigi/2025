// ignore_for_file: lines_longer_than_80_chars

import 'package:app/features/session/data/model/session.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_provider.g.dart';

final List<SessionVenue> _venues = [
  const SessionVenue(id: 'venue1', name: 'Room A'),
  const SessionVenue(id: 'venue2', name: 'Room B'),
  const SessionVenue(id: 'venue3', name: 'Room C'),
  const SessionVenue(id: 'venue4', name: 'Room D'),
];

@riverpod
Future<List<Session>> sessions(Ref ref) async {
  return [
    /// 10:45 - 11:15
    Session(
      id: 'session1',
      title: 'Flutterコントリビューションのススメ',
      description:
          '## 概要\r\n\r\nFlutterに「こんな機能があったら便利なのに」と思ったことはありませんか？ 不具合がFlutterのバグによるものであることが判明し、「Flutter SDKのバグが直れば解消できるのですが」と共有したことはありませんか？\r\nFlutterはオープンソースプロジェクトであり、誰でも貢献できます。あなたのアイデアや不満は、あなたの貢献のきっかけになるかもしれません。\r\n\r\n本セッションは「なぜFlutterの開発に"あなた"がなぜ関わるべきなのか」をテーマに、Flutterのコントリビューションの魅力と方法についてお話しします。また、話者がFlutterの開発に関わることで得た知識や経験をもとに、コントリビューションの様々な価値を紹介します。\r\n\r\n## 想定視聴者\r\n\r\n* Flutterの将来性に興味がある方\r\n* Flutterにコントリビューションに向けて背中を押してほしい方',
      startsAt: DateTime(2025, 11, 21, 10, 45),
      endsAt: DateTime(2025, 11, 21, 11, 15),
      venue: _venues[0],
      speakers: [
        Speaker(
          id: 'koji-1009',
          name: 'koji-1009',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/daf94af4-8959-4e8a-baea-bfa12f861a65.jpg',
          ),
          xUrl: Uri.parse('https://x.com/D_R_1009'),
        ),
      ],
    ),
    Session(
      id: 'session2',
      title: 'あの日のHot reloadはなぜ動かなかったのか？ 〜OSセキュリティ(W^X)とJITコンパイラの攻防〜',
      description:
          '## 概要\r\niOS26の発表直後、FlutterのHot reloadが実機では動作しない問題が発生し、アプリ開発者は窮地に立たされまさした。\r\nこの問題は現代のOSのセキュリティ制約とJITコンパイラが深く関わっています。この課題にどう向き合い、どう解決していったのかを時系列で振り返りましょう。この解決の過程を振り返ることで、フレームワークへの理解が更に進み、FlutterのコアであるHot reload技術についてより深い知見を得ることができます。\r\nフレームワークやVMのアップデートが、どうやって自分たちの開発体験やアプリの品質に直結するのかを追体験しましょう。\r\n\r\n## 想定視聴者\r\n- iOS26にてHot reloadが動作しない問題の裏側で起きていたことを知りたい人\r\n- 普段使っているFlutter/Dartが、OSレベルのセキュリティ制約とどう向き合っているか知りたい人\r\n',
      startsAt: DateTime(2025, 11, 21, 10, 45),
      endsAt: DateTime(2025, 11, 21, 11, 15),
      venue: _venues[1],
      speakers: [
        Speaker(
          id: 'chigichan24',
          name: 'chigichan24',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/6070650f-7082-4529-8c5c-4a363698bde9.png',
          ),
          xUrl: Uri.parse('https://x.com/chigichan24'),
        ),
      ],
    ),

    /// 11:30 - 12:00
    Session(
      id: 'session3',
      title: 'Flutter DevToolsで発見！本番アプリのパフォーマンス問題と改善の実践',
      description:
          '## 概要\r\nアプリリリース後、ユーザーから「アプリが重い」との問い合わせが多数寄せられた経験はありませんか？本セッションでは、実際のプロダクションアプリでパフォーマンス問題に直面した際の調査から改善までの実践的なアプローチを共有します。\r\n\r\nFlutter DevToolsを活用したパフォーマンス分析により、不要なリビルド、再描画、UIJankなどの問題を特定し、それらを改善した実体験をもとに、以下の内容をお話しします：\r\n\r\n- Flutter DevToolsを使った効果的なパフォーマンス調査手法\r\n- Riverpodによる状態管理で陥りがちなアンチパターンとその対策\r\n- 画像キャッシュサイズの最適化による描画パフォーマンス向上\r\n\r\n## 想定視聴者\r\n- パフォーマンス問題に悩んでいるFlutter開発者\r\n- Flutter DevToolsの効果的な活用法を知りたい方',
      startsAt: DateTime(2025, 11, 21, 11, 30),
      endsAt: DateTime(2025, 11, 21, 12),
      venue: _venues[0],
      speakers: [
        Speaker(
          id: 'Goto Kosuke',
          name: 'Goto Kosuke',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/c730997b-ec35-456f-96d9-e2b9e01d8479.jpg',
          ),
          xUrl: Uri.parse('https://x.com/Gotchi0001'),
        ),
      ],
    ),
    Session(
      id: 'session4',
      title: 'Impellerで何が変わったのか',
      description:
          '## 概要\r\nFlutter 3.10から標準になった描画エンジンImpellerは、それまでの標準であったSkiaと比較すると、描画処理の最適化、シェーダーの事前コンパイルにより、特にMetal(iOS,macOS)での動作が大幅に安定しました。\r\n\r\nしかし、Impellerの恩恵はそれだけではありません。\r\n描画までの中間コードが削減されたことで、3D描画を実現するFlutter GPUや、高性能化したdart:uiのシェーダー機能など、Flutterの新たな可能性を開く基盤となっています。\r\n\r\n本セッションでは、ImpellerとSkiaの描画の仕組みを比較解説し、Impellerが実現した新機能の技術的背景を深掘りします。\r\n\r\n## 想定視聴者\r\nFlutterの描画の仕組みを理解したい方\r\n描画エンジンレベルでのパフォーマンス改善を試みたい方\r\nシェーダーによる視覚表現や3D描画に興味のある方',
      startsAt: DateTime(2025, 11, 21, 11, 30),
      endsAt: DateTime(2025, 11, 21, 12),
      venue: _venues[1],
      speakers: [
        Speaker(
          id: 'aq',
          name: 'aq',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/fa7d7dca-fe37-4656-9279-aa2e47475f4c.png',
          ),
          xUrl: Uri.parse('https://x.com/aqhayami'),
        ),
      ],
    ),
    Session(
      id: 'session5',
      title: 'Flutter is NOT DEAD.',
      description:
          '## 概要\r\n\r\n2025/6/9、Appleは新たなデザイン言語であるLiquid Glassを発表しました。\r\nそしてコミュニティから挙がった声は……\r\n\r\n「Flutterはこのムーブメントについていけない、終わりだ！」「Flutter is dead.」 ……\r\n\r\nなるほど、確かにFlutterは構造上、Liquid Glassを取り込むことは難しいです。\r\nでは、Flutterは本当に死を迎えたのでしょうか？\r\n\r\n自分はそうは思いません。\r\nむしろ、Flutterの真価はプラットフォーム固有の事情に左右されないことにあると考えています。\r\nこのトークでは、Flutterの立ち位置や採用する価値を整理したうえで、どのようなプロジェクトにFlutterが最適なのか？というお話をします。\r\n\r\n## 想定視聴者\r\n\r\n- Flutterを使い続けられるのか悩んでいるSWE\r\n- その他様々な領域のSWE',
      startsAt: DateTime(2025, 11, 21, 11, 30),
      endsAt: DateTime(2025, 11, 21, 12),
      venue: _venues[2],
      speakers: [
        Speaker(
          id: 'Kurogoma4D',
          name: 'Kurogoma4D',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/7f85df83-323d-444c-92d5-e2fd390e351e.jpg',
          ),
          xUrl: Uri.parse('https://x.com/Krgm4D'),
        ),
      ],
    ),

    /// 13:15 - 13:45
    Session(
      id: 'session6',
      title: 'スポンサーセッション：株式会社ゆめみ',
      description: '',
      startsAt: DateTime(2025, 11, 21, 13, 15),
      endsAt: DateTime(2025, 11, 21, 13, 45),
      venue: _venues[0],
      speakers: [],
      sponsorId: 1,
    ),
    Session(
      id: 'session7',
      title: 'Flutterビルドキャッシュの内部構造とテスト高速化への応用',
      description:
          '## 概要\r\nFlutter開発では、アプリケーションの実行や配布のたびにビルドが発生します。\r\n通常、ビルドキャッシュは意識せずとも自動で働きますが、その仕組みを理解することで開発効率をさらに高められます。\r\n本セッションでは、Flutter SDKの内部実装に触れながら、ビルドキャッシュの構造と動作を詳しく解説します。\r\nまた、キャッシュが有効・無効になる条件を理解し、 `flutter test` 実行時の不要な再ビルドを回避することで、テスト実行を高速化できる実践的なアプローチも紹介します。\r\n\r\n## 想定視聴者\r\n- Flutterビルドキャッシュの仕組みを体系的に理解したい方\r\n- テスト実行時のビルド高速化に関心のある方\r\n- `build/` ディレクトリや `.dill` ファイルなど、ビルド成果物の正体を知りたい方',
      startsAt: DateTime(2025, 11, 21, 13, 15),
      endsAt: DateTime(2025, 11, 21, 13, 45),
      venue: _venues[3],
      speakers: [
        Speaker(
          id: 'yoko',
          name: 'yoko',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/861cadb3-d5b5-4e6c-aefd-4081894babc3.jpg',
          ),
          xUrl: Uri.parse('https://x.com/_yoko_com'),
        ),
      ],
    ),

    /// ビギナーズLT 13:15 - 13:40
    Session(
      id: 'session8',
      title: 'BuildContextの正体とInheritedWidgetの仕組み',
      description:
          '# 概要\r\nFlutter開発で頻繁に利用されるBuildContext。しかし、その役割の曖昧な理解は、パフォーマンス低下や予期せぬエラーの要因となります。 \r\n\r\n本LTでは、UIツリーでのBuildContextの位置と役割、そしてInheritedWidgetがデータ伝達と再構築にどう影響するかを解説します。\r\n\r\n「Widgetのどこでcontextを使えばいいのか」が腑に落ちて、状態管理や画面遷移でつまずかないための最初の理解の壁を突破できることを目指します。\r\n\r\n# 想定視聴者\r\n- contextの扱い方に自信がない方\r\n- Widgetのどこでcontextを使うべきか迷うことがある方\r\n- 状態管理や画面遷移で「なぜか動かない問題」に直面した経験がある方',
      startsAt: DateTime(2025, 11, 21, 13, 15),
      endsAt: DateTime(2025, 11, 21, 13, 20),
      venue: _venues[2],
      speakers: [
        Speaker(
          id: 'Hiroki Kawamura',
          name: 'Hiroki Kawamura',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/905caac6-5356-4f62-849e-a09aa2fc3542.jpg',
          ),
          xUrl: Uri.parse('https://x.com/hecuhecu'),
        ),
      ],
      isBeginnersLightningTalk: true,
    ),
    Session(
      id: 'session9',
      title: 'MVVM から MVVM-C に変えてみた話 〜画面遷移どうしてる？〜',
      description:
          '概要\r\nFlutterでMVVMアーキテクチャを採用した際、\r\n画面遷移処理がViewModelやViewに分散し、責務の分離やテストが難しくなる課題に直面しました。\r\n特に、Navigator.pushや外部リンク遷移がビジネスロジックに混在すると、保守やUIテストが煩雑になります。\r\n\r\nそこで本LTでは、MVVMにCoordinatorを組み合わせたMVVM-Cアーキテクチャを導入し、\r\n遷移処理の責務を一元化・明確化した事例を紹介します。\r\n\r\nこのLTではMVVM-Cについて、以下のポイントを紹介します\r\n- MVVMのおさらい\r\n- なぜCoordinatorがいるのか？\r\n- 実際どんな構成になったか\r\n- 画面遷移テストが楽になる話\r\n\r\n想定視聴者\r\n- MVVMアーキテクチャを使用している方\r\n- 画面遷移が複雑になってきて不安な人\r\n- 画面遷移テストに苦しんでいる方\r\n- アーキテクチャに興味ある方',
      startsAt: DateTime(2025, 11, 21, 13, 20),
      endsAt: DateTime(2025, 11, 21, 13, 25),
      venue: _venues[2],
      speakers: [
        Speaker(
          id: '陳 信瑜',
          name: '陳 信瑜',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/99828a15-a806-425e-bbd2-4dd97c09d577.jpg',
          ),
          xUrl: Uri.parse('https://x.com/ts00484515'),
        ),
      ],
      isBeginnersLightningTalk: true,
    ),
    Session(
      id: 'session10',
      title: 'ノリと勢いでFlutter専門サークルを創設したら3年目に突入した話',
      description:
          '**概要**\r\n\r\nプログラミングへの挫折から再起し、「ノリと勢い」でFlutter開発サークル「ぽちぽちのつどい」を大阪大学に創設した3年間の軌跡を語ります\r\n\r\n**想定視聴者**\r\n\r\n*   **プログラミング学習者・初心者**：学習における挫折経験や効果的な学習方法、モチベーション維持に関心がある方々。\r\n*   **プログラミングサークル・学生コミュニティ運営者**：サークル設立・運営の課題、メンバー集め、組織化、外部連携、そして円滑な継承に関心がある方々。\r\n*   **学生エンジニア全般**：実践的なチーム開発経験、技術的学び、そして学生コミュニティでの交流や成長に興味がある方々。',
      startsAt: DateTime(2025, 11, 21, 13, 25),
      endsAt: DateTime(2025, 11, 21, 13, 30),
      venue: _venues[2],
      speakers: [
        Speaker(
          id: 'みそしる',
          name: 'みそしる',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/7f8f8bee-8f74-4472-9ac7-8cc620207b54.jpg',
          ),
          xUrl: Uri.parse('https://x.com/miso_shiru_app'),
        ),
      ],
      isBeginnersLightningTalk: true,
    ),
    Session(
      id: 'session11',
      title: 'Flutter ネイティブ連携手法 2025',
      description:
          'Flutterでネイティブ機能を使う方法、いくつ知っていますか？\r\n基本のMethod Channel/EventChannelから、dart:ffiを使った直接バインディング、BasicMessageChannel、\r\nそしてPigeonなどのコード生成ツールまで。選択肢は実に多様です。\r\n\r\n「結局どれを使えばいいの？」\r\n「それぞれの違いは？」\r\nこのLTでは、主要な連携手法の実装例（Dart側・ネイティブ側）を実際のコードで比較しながら、\r\nそれぞれの特徴と適用場面を整理します。\r\n\r\n各手法を理解し、プロジェクトに応じた最適な選択ができるようになることが目標です。',
      startsAt: DateTime(2025, 11, 21, 13, 30),
      endsAt: DateTime(2025, 11, 21, 13, 35),
      venue: _venues[2],
      speakers: [
        Speaker(
          id: 'atsumi3',
          name: 'atsumi3',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/37b02ecb-4539-4ab4-b2c2-2df47a66b33c.jpg',
          ),
          xUrl: Uri.parse('https://x.com/fox9s'),
        ),
      ],
      isBeginnersLightningTalk: true,
    ),
    Session(
      id: 'session12',
      title: 'Server-Driven UIでアプリを作る',
      description:
          'Server-Driven UIでプロダクト開発してますか？\r\n\r\nServer-Driven UI（SDUI）はAirbnbが用いた設計手法でUIの構造、レイアウト、さらには一部の動作ロジックを、クライアント側ではなくサーバー側で定義・制御するアーキテクチャパターンです。\r\n\r\nモバイルアプリ開発においてA/Bテスト等でUIを分ける際にいくつかやり方があるかと思いますが、\r\nこのLTではStacというFlutter専用のSDUIのFrameworkを用いた紹介をします。\r\n',
      startsAt: DateTime(2025, 11, 21, 13, 35),
      endsAt: DateTime(2025, 11, 21, 13, 40),
      venue: _venues[2],
      speakers: [
        Speaker(
          id: 'Take',
          name: 'Take',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/a77540eb-4583-49d3-878d-006730b33f46.jpg',
          ),
          xUrl: Uri.parse('https://x.com/tkmssh'),
        ),
      ],
    ),

    /// 14:00 - 14:30
    Session(
      id: 'session13',
      title: 'Flutterで挑む次世代認証：Flutter銀行アプリにおける導入実録とその教訓',
      description:
          '## 概要\r\nFlutter製の銀行アプリにFIDOパスキー認証を導入した事例をもとに、クロスプラットフォームでの実装課題と解決策を解説します。ドキュメントにない仕様差や想定外の不具合、検証時の落とし穴など、現場のリアルな学びをお届けします。\r\n\r\n## 想定視聴者\r\nFlutterで認証やネイティブ連携を扱いに興味ある方、初級〜上級開発者',
      startsAt: DateTime(2025, 11, 21, 14),
      endsAt: DateTime(2025, 11, 21, 14, 30),
      venue: _venues[0],
      speakers: [
        Speaker(
          id: 'heyhey1028',
          name: 'heyhey1028',
          xUrl: Uri.parse('https://x.com/heyhey1028'),
        ),
      ],
    ),
    Session(
      id: 'session14',
      title: 'スポンサーセッション：株式会社出前館',
      description: '',
      startsAt: DateTime(2025, 11, 21, 14),
      endsAt: DateTime(2025, 11, 21, 14, 30),
      venue: _venues[1],
      sponsorId: 2,
    ),
    Session(
      id: 'session15',
      title: 'Mobile MCP × Dart VM  Service Extensionで実現するAI駆動E2Eテスト整備と自動操作',
      description:
          '## 概要\r\nE2Eテストには「カバレッジ向上が大変」、「メンテナンスコストが高い」といった課題があります。AIによるモバイルアプリの自動操作でこれらの課題を解決します。AIがアプリを自動操作することで、E2Eテストの作成においてGUIをコンテキストとして扱うことができるようになります。これによりE2Eテスト作成の精度と効率を向上させます。\r\n\r\nまた、AIによるモバイルアプリの自動操作はMobile MCPによって実現されます。しかしFlutterのレンダリング方式が原因でそのままでは利用できません。そこでDart VM Service extensionを利用してMCPを拡張し、Flutterアプリに対応させた方法についてもお話します。\r\n\r\n## 想定視聴者\r\nE2Eテストの拡充を課題としている方\r\nAI x アプリのエンジニアリングに興味がある方',
      startsAt: DateTime(2025, 11, 21, 14),
      endsAt: DateTime(2025, 11, 21, 14, 30),
      venue: _venues[2],
      speakers: [
        Speaker(
          id: '酒井佑旗',
          name: '酒井佑旗',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/1249f0c2-0c7c-4ec7-8808-cd74219c1f7e.jpg',
          ),
          xUrl: Uri.parse('https://x.com/yu12k25i'),
        ),
      ],
    ),

    /// 15:00 - 15:30
    Session(
      id: 'session16',
      title: 'スポンサーセッション：株式会社アサイン',
      description: '',
      startsAt: DateTime(2025, 11, 21, 15),
      endsAt: DateTime(2025, 11, 21, 15, 30),
      venue: _venues[0],
      sponsorId: 3,
    ),
    Session(
      id: 'session17',
      title: 'RenderObject とは何か？animated_to に学ぶレイアウト計算と描画の仕組み',
      description:
          '## 概要\r\nWidget の「移動」をアニメーションする animated_to というパッケージを開発して公開しました。これを使うと from/to を計算することなく自由に Widget を動かせます。\r\n\r\nそんな animated_to は RenderObject をカスタマイズすることで実現しています。from/to の計算、描画位置の更新、これらはいずれも RenderObject の仕事であり、そこに Widget のリビルドは発生しません。リビルドが必要ないのでアニメーションも滑らかです。\r\n\r\nこのセッションでは、animated_to の実装を例に RenderObject の仕組みとカスタマイズ方法について説明します。\r\n\r\n## 想定視聴者\r\n- Flutter の内部的な仕組みに興味のある方\r\n- 描画のパフォーマンスを細かくチューニングしたい方',
      startsAt: DateTime(2025, 11, 21, 15),
      endsAt: DateTime(2025, 11, 21, 15, 30),
      venue: _venues[1],
      speakers: [
        Speaker(
          id: 'ちゅーやん',
          name: 'ちゅーやん',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/94e167ea-b660-4d55-bce4-22ce184f9e11.jpg',
          ),
          xUrl: Uri.parse('https://x.com/chooyan_i18n'),
        ),
      ],
    ),
    Session(
      id: 'session18',
      title: 'Flutter Webの真価：SEOフレンドリーなPWAとデスクトップアプリケーションへの展開',
      description:
          '## 概要\r\nFlutterはモバイルアプリ開発の強力なツールとして確立されていますが、Flutter Webの可能性はまだ十分に認識されていないかもしれません。本セッションでは、Flutter Webの最新の進捗と、特にSEO（検索エンジン最適化）フレンドリーなプログレッシブウェブアプリ（PWA）を構築するための具体的な戦略に焦点を当てます。レンダリングモードの選択（HTML vs Canvas Kit）、ルーティングとURL管理、メタデータの設定、Service Workerの活用など、Flutter Webで高性能かつSEOに強いPWAを開発するための実践的なテクニックを解説します。マルチプラットフォーム戦略におけるFlutter Webの真価を探ります。\r\n\r\n## 想定視聴者\r\nFlutter開発者、Web開発者、プロダクトオーナー\r\n',
      startsAt: DateTime(2025, 11, 21, 15),
      endsAt: DateTime(2025, 11, 21, 15, 30),
      venue: _venues[2],
      speakers: [
        Speaker(
          id: '山崎謙登',
          name: '山崎謙登',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/b672422f-98c2-493b-b91a-ed8f784cefd8.jpg',
          ),
          xUrl: Uri.parse('https://x.com/kent_strong_dev'),
        ),
      ],
    ),

    /// 16：00 - 16:30
    Session(
      id: 'session19',
      title: 'DartASTとその活用',
      description:
          '# 概要\r\n私たちは日常的にLinterやコードフォーマッター、freezedやjson_serializableといったコード生成ライブラリの恩恵を受けています。これらの強力なツールは、私たちのコードの品質を保ち、開発効率を飛躍的に向上させてくれます。\r\nでは、これらのツールはどのようにして私たちの書いたコードを理解し、解析・変換しているのでしょうか？ その答えを探る中で重要になるのが AST (抽象構文木) です。\r\n本セッションでは、Dartの公式に提供されている`analyzer`パッケージを使用し、Dartコードがどのように木構造に変換されるのかを解説します。さらに、そのASTを活用して、実際にカスタムLinterやコードジェネレーターがどのように作られているのか、その仕組みと具体的なアプローチをデモを交えながら紹介します。\r\n\r\n# 対象者\r\n* Dartのコード解析や変換に興味がある方',
      startsAt: DateTime(2025, 11, 21, 16),
      endsAt: DateTime(2025, 11, 21, 16, 30),
      venue: _venues[0],
      speakers: [
        Speaker(
          id: 'そた',
          name: 'そた',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/9812e629-9f1e-4350-b399-cf3797bda08a.jpg',
          ),
          xUrl: Uri.parse('https://x.com/_sotaatos'),
        ),
      ],
    ),
    Session(
      id: 'session20',
      title: 'スポンサーセッション：RevenueCat',
      description: '',
      startsAt: DateTime(2025, 11, 21, 16),
      endsAt: DateTime(2025, 11, 21, 16, 30),
      venue: _venues[1],
      sponsorId: 4,
    ),

    /// LT 16:00 - 16:25
    Session(
      id: 'session21',
      title: 'それでは聞いてください「Impeller導入に失敗しました」',
      description:
          '## 概要\r\nFlutter 3.27.0 がリリースされ、 Android においても Impeller が標準となりました。\r\n我々はAndroid のパフォーマンス向上を期待し、 Flutter をアップグレードすることに決めました。\r\n手元の端末たちでは問題なく動作したため、アプリをリリースしました。\r\n気がつくと、ユーザー様からクレームをたくさん頂くことになりました。\r\n\r\nこのセッションでは、失敗した経緯をみなさんと笑顔で振り返り、今後の糧とさせていただきます。\r\n\r\n## 想定視聴者\r\n* Flutter バージョンアップに取り組んでいる方\r\n* Flutter バージョンアップのタイミングに悩んでいる方\r\n* Flutter バージョンアップの失敗を一緒に笑っていただける方',
      startsAt: DateTime(2025, 11, 21, 16),
      endsAt: DateTime(2025, 11, 21, 16, 05),
      venue: _venues[2],
      speakers: [
        Speaker(
          id: 'tacck',
          name: 'tacck',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/96edeb53-6ae0-4005-bfd6-510ccf325d7d.jpg',
          ),
          xUrl: Uri.parse('https://x.com/tacck'),
        ),
      ],
      isLightningTalk: true,
    ),
    Session(
      id: 'session22',
      title: 'Add-to-appで真のLiquid Glass対応を目指してみた',
      description:
          '## 概要\r\nみなさんはFlutterのデザインはどのようにする派閥でしょうか？\r\n自分は圧倒的にネイティブデザイン派閥でした。ですがWWDC25でLiquid Glassが発表された今、ネイティブデザイン派閥は危機に直面しています。\r\nコミュニティの動きはとても早くLiquid Glassの見た目の再現はすぐに達成されましたが、Flutter内で見た目だけ再現してもLiquid Glassの思想まで再現したとは残念ながら言えません。\r\n\r\nそこで今回FlutterのAdd-to-appの機能を使って、Liquid GlassのナビゲーションレイヤーをSwiftUIで、コンテンツレイヤーをFlutterで記述するという形式にトライし、どこまでうまくいくのか？何が課題なのか？をざっくりと紹介していきます。\r\n\r\n## 想定視聴者\r\n- iOSやデザインが好きなFlutterに関わる全ての人\r\n',
      startsAt: DateTime(2025, 11, 21, 16, 05),
      endsAt: DateTime(2025, 11, 21, 16, 10),
      venue: _venues[2],
      speakers: [
        Speaker(
          id: '藤井陽介',
          name: '藤井陽介',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/cacf8c47-8ba4-49e9-96fd-0daaa4f4c1d9.jpg',
          ),
          xUrl: Uri.parse('https://x.com/touyou_dev'),
        ),
      ],
      isLightningTalk: true,
    ),
    Session(
      id: 'session23',
      title: 'iOSのAssistive Accessって何？Flutterでも気をつけたいUIの話',
      description:
          '## 概要\r\niOS 17で登場した「Assistive Access」機能をご存知ですか？\r\n一見するとFlutter開発者には無縁に思えるかもしれませんが、実はこの機能には認知にやさしいUI設計における多くのヒントが詰まっています。\r\n\r\n本LTでは、Assistive Accessの概要とともに、Flutterアプリでも活かせる認知負荷を軽減するためのデザイン原則を紹介します。\r\n特に、「ボタンはたくさんあったほうが便利」や「多機能こそユーザーフレンドリー」といった常識に疑問を投げかけ、誰にとってもわかりやすく、操作しやすいUIを考えるきっかけとなるセッションを目指します。\r\n\r\n認知負荷の視点から、自分のアプリ設計を見直してみませんか？\r\n\r\n## 想定視聴者\r\n* Assistive Accessに対応していないFlutterアプリ開発者\r\n* 認知にやさしいUI設計をしたいFlutterアプリ開発者',
      startsAt: DateTime(2025, 11, 21, 16, 10),
      endsAt: DateTime(2025, 11, 21, 16, 15),
      venue: _venues[2],
      speakers: [
        Speaker(
          id: '野瀬田　裕樹',
          name: '野瀬田　裕樹',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/fde678c5-e84e-43e0-b022-680cd354faea.jpg',
          ),
          xUrl: Uri.parse('https://x.com/ynoseda'),
        ),
      ],
      isLightningTalk: true,
    ),
    Session(
      id: 'session24',
      title: 'ユーザーのアクションを伴うWidgetのGoldenTest',
      description:
          '## 概要\r\nFlutterアプリのUI品質を担保する手法としてGoldenTestは非常に有効ですが、 スクロールを伴うWidgetでは一筋縄ではいきません。 本LTでは、まずGoldenTestの基本的な仕組みと利点を解説し、 ScrollViewを用いたWidgetのGoldenTestの実践方法を紹介します。 続いて、Sliverを利用した場合に直面する悩みを取り上げます。その上で、SliverでのGoldenTestを実現するためのテクニックとして、 スクロール量をプログラムで指定する方法や、Finderを活用して特定のWidgetを検出・検証する方法を具体的なコード例とともに解説します。 \r\n\r\n## 想定視聴者\r\nGoldenTestの幅を広げ、より堅牢なUIテストを目指す方におすすめの内容です。',
      startsAt: DateTime(2025, 11, 21, 16, 15),
      endsAt: DateTime(2025, 11, 21, 16, 20),
      venue: _venues[2],
      speakers: [
        const Speaker(
          id: 'horie',
          name: 'horie',
        ),
      ],
      isLightningTalk: true,
    ),
    Session(
      id: 'session25',
      title: 'Flutterアプリ運用の現場で役立った監視Tips 5選',
      description:
          '## 概要\r\nFlutterアプリの運用では、監視ツールを導入するだけでは十分ではなく、「どう使うか」が成果を左右します。\r\nこのLTでは、監視ツールを使っていく中で見えてきた、運用フェーズで実際に効果があったTipsを5つに絞って紹介します。\r\n\r\nどれも大がかりな仕組みではなく、ちょっとした工夫や設定変更で再現できる内容に絞っています。\r\n「導入はしたけどあまり活用できていない」「もう少しうまく使いたい」という方にとって、すぐ試せる小さな改善のヒントになるはずです。\r\n\r\n## 想定視聴者\r\nFlutterアプリの監視に興味がある方',
      startsAt: DateTime(2025, 11, 21, 16, 20),
      endsAt: DateTime(2025, 11, 21, 16, 25),
      venue: _venues[2],
      speakers: [
        Speaker(
          id: 'おさたく',
          name: 'おさたく',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/30ccb6e6-3271-4047-a5f3-5018ab6b000b.jpg',
          ),
          xUrl: Uri.parse('https://x.com/ostk0069'),
        ),
      ],
      isLightningTalk: true,
    ),

    /// 16:45 - 17:15
    Session(
      id: 'session26',
      title: 'アプリバイナリに対する不正対策とセキュリティ向上',
      description:
          '## 概要\r\nアプリはコード改竄やリバースエンジニアリングによる脅威に常に晒されています。\r\nデバイスのルート化や不正ツールの利用によってサービス内での不正利用も考えられます。\r\n\r\n今回は"デバイスから取得可能な物理データをもとにポイントを獲得できるような機能"を題材にして、\r\n不正対策やセキュリティ向上を考えます。\r\n\r\n- バイナリへのセキュリティ\r\n    - 暗号化・難読化\r\n- デバイスへのセキュリティ\r\n    - Firebase AppCheck活用\r\n    - デバイスから取得する物理データの整合性判定\r\n- 複合的なセキュリティ\r\n    - ストア設定から取れる対策\r\n\r\n本セッションでは不正のユースケースに対して取れるアプローチをご紹介します。\r\n\r\n## 想定視聴者\r\n- ポイント付与型のサービス運営をされている方\r\n- 不正アカウントや不正リクエストに悩まされている方',
      startsAt: DateTime(2025, 11, 21, 16, 45),
      endsAt: DateTime(2025, 11, 21, 17, 15),
      speakers: [
        Speaker(
          id: 'FujiKinaga',
          name: 'FujiKinaga',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/92f605a9-408d-4601-a1a4-8f07e3e390f7.jpg',
          ),
          xUrl: Uri.parse('https://x.com/fuji_kinaga'),
        ),
      ],
      venue: _venues[0],
    ),
    Session(
      id: 'session27',
      title: 'モバイル端末で動くLLMはどこまで実用的なのか',
      description:
          '## 概要\r\n昨今のAIは信じられない速度で進化しており、与えられたトークンをもとに考える能力やスピードは私たちを圧倒していますが、私たちの生活そのものを変えるほどの新たな知識を与えるには、その手法やセキュリティなど多くの問題が存在します。\r\nその答えのひとつとして、モバイル端末という閉じられた環境で動くAIがあると思います。\r\n最近はGemma 3nなどモバイル端末上で動かすことを想定したLLMもでてきており、それらを利用することでよりセキュアかつローコストにAIを利用することができるようになりますが、果たして現状どこまで実用的なのでしょうか？\r\n\r\nこのセッションでは、実際にLLMをアプリに導入して動かす方法や、モデルに備わったRAGやFunction Callingなどの機能の実装に挑戦し、その実用性に迫ります。\r\n\r\n## 想定視聴者\r\nモバイルデバイスでAIを動かしたい方',
      startsAt: DateTime(2025, 11, 21, 16, 45),
      endsAt: DateTime(2025, 11, 21, 17, 15),
      venue: _venues[2],
      speakers: [
        Speaker(
          id: 'KyoheiG3',
          name: 'KyoheiG3',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/46c5425e-d29e-44bb-8ca0-9fd3986b3276.jpg',
          ),
          xUrl: Uri.parse('https://x.com/KyoheiG3'),
        ),
      ],
    ),
    Session(
      id: 'session28',
      title: 'アクセシビリティ、まだ完璧じゃないけど──“今から”できること',
      description:
          '## 概要\r\n「アクセシビリティ、大事なのはわかってる。だけど、どうしても後回しになってしまう」──そんな経験、ありませんか？\r\n私たちのチームもそうでした。初期リリースでは対応できておらず、今も完璧ではありません。\r\n\r\nこのセッションでは、アクセシビリティ改善の実体験をもとに、今からでも始められることを中心にお話しします。\r\n\r\n・今さら対応するのって大変じゃない？\r\n・チーム全体でどうやって意識づける？\r\n・アクセシビリティ改善って正直どこまでやればいいの？\r\n\r\nそんな悩みに寄り添いながら、100点を目指さなくても、0点を1点にする方法を一緒に考えます。\r\n“やれてない”を責めるのではなく、“今からやっていける”ことを持ち帰ってもらえる時間にしたいと思っています。\r\n\r\n## 想定視聴者\r\n- アクセシビリティ対応が後回しになってる方\r\n- アクセシビリティ対応をどうチームで取り組んでいけば良いかわからない方\r\n',
      startsAt: DateTime(2025, 11, 21, 16, 45),
      endsAt: DateTime(2025, 11, 21, 17, 15),
      speakers: [
        Speaker(
          id: 'kuno',
          name: 'kuno',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/b8e33006-1a2f-4f90-bc34-df3652a5c1fc.jpg',
          ),
          xUrl: Uri.parse('https://x.com/Kunodayo_oboete'),
        ),
      ],
      venue: _venues[3],
    ),

    /// 17:30 - 18:00
    Session(
      id: 'session29',
      title: 'オフライン対応！Flutterアプリに全文検索エンジンを実装する',
      description:
          '## 概要\r\n本セッションでは、Flutterアプリにオフラインで動作する全文検索（Full Text Search）機能を組み込むために開発したパッケージと、その中で活用した flutter_rust_bridge の実装事例を紹介します。　学習コストが高いとされる flutter_rust_bridge をFlutter開発者がどのように扱えるのかを、具体的なコード例とともにわかりやすく解説します。　さらに、CJK（中日韓文字）への対応や、マルチプラットフォーム対応した話についても共有します。\r\n\r\n## 想定視聴者\r\n- ネイティブ連携でアプリのパフォーマンス向上に興味があるFlutter開発者\r\n- Rustやflutter_rust_bridgeに興味がある開発者\r\n- オフライン環境での高機能検索をアプリに導入したいエンジニア\r\n',
      startsAt: DateTime(2025, 11, 21, 17, 30),
      endsAt: DateTime(2025, 11, 21, 18),
      venue: _venues[2],
      speakers: [
        Speaker(
          id: 'Dreamwalker',
          name: 'Dreamwalker',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/ffce8652-a86a-4ed7-bc7e-e91f2be32c6c.jpg',
          ),
          xUrl: Uri.parse('https://x.com/jaichangpark'),
        ),
      ],
    ),

    /// LT 17:30 - 17:55
    Session(
      id: 'session30',
      title: '24時間止まらないFlutterアプリの作り方',
      description:
          '## 概要\r\nFlutterアプリをAndroid端末でキオスクモード（アプリ固定モード）運用する方法を解説します。Device Owner権限の設定方法、Flutterでの実装、RemoteConfigを使った自動アップデートなど、業務用端末として安定運用するための実践的な知識を5分でお伝えします。\r\n\r\n## 想定視聴者\r\n- Flutterで店舗向け・業務用アプリを開発している方\r\n- キオスクモードの実装方法を探している方\r\n- MDMを使わないデバイス管理に興味がある方\r\n',
      startsAt: DateTime(2025, 11, 21, 17, 30),
      endsAt: DateTime(2025, 11, 21, 17, 35),
      venue: _venues[3],
      speakers: [
        Speaker(
          id: 'きしもと',
          name: 'きしもと',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/6e2f169e-4ba3-4dc8-8f71-c914f9465a2c.jpg',
          ),
          xUrl: Uri.parse('https://x.com/uuuuuuuuuuuuku'),
        ),
      ],
      isLightningTalk: true,
    ),
    Session(
      id: 'session31',
      title: 'カスタムジェスチャーの実装から学ぶGesture',
      description:
          '## 概要\r\nFlutterの標準的なジェスチャー検出は強力ですが、特定の開発シーンでは複数のジェスチャーの競合や、ユーザー体験に合わせた独自動作の定義といった課題に直面します。\r\n本セッションでは、こうした課題を踏まえて、Flutterアプリにおけるカスタムジェスチャーの実装例を軸に、Gestureの認識メカニズムや競合解決のアプローチなど、内部処理を含めて掘り下げて解説します。\r\n\r\n- Flutterにおけるジェスチャー検出の基礎\r\n- ジェスチャーの認識メカニズムと競合\r\n- カスタムジェスチャーの実践的な実装テクニックの紹介\r\n\r\n## 想定視聴者\r\n- Flutterのジェスチャー処理や内部実装に興味がある方\r\n- アプリ開発で高度なユーザー体験やデバッグ機能の実装を検討している方',
      startsAt: DateTime(2025, 11, 21, 17, 35),
      endsAt: DateTime(2025, 11, 21, 17, 40),
      venue: _venues[3],
      speakers: [
        Speaker(
          id: 'techiro',
          name: 'techiro',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/ba42954c-c104-48c0-a07f-f51d9574870d.jpg',
          ),
          xUrl: Uri.parse('https://x.com/appgrape'),
        ),
      ],
      isLightningTalk: true,
    ),
    Session(
      id: 'session32',
      title: 'Master of Widget Key ~ Widget 再利用とパフォーマンス最適化 ~',
      description:
          '## 概要\r\nなぜ Key が必要なのか、正しく使わないとどうなるかを実例で比較。\r\n\r\n- ValueKey／ObjectKey／UniqueKey／GlobalKey の違い\r\n- リストアイテムの入れ替え／アニメーションでの挙動\r\n- 過剰使用を避けるベストプラクティス\r\n\r\n## 想定視聴者\r\n- 実装時にKeyの挙動でつまずいたことがある中級~上級のFlutter開発者',
      startsAt: DateTime(2025, 11, 21, 17, 40),
      endsAt: DateTime(2025, 11, 21, 17, 45),
      venue: _venues[3],
      speakers: [
        const Speaker(
          id: '新垣清奈',
          name: '新垣清奈',
        ),
      ],
      isLightningTalk: true,
    ),
    Session(
      id: 'session33',
      title: 'そのローカルDB、プロジェクトに合ってますか? 明日から変える最適なDB',
      description:
          'Flutter開発において、ローカルDBの選定は開発体験を左右する重要な要素です。 \r\nしかし、ローカルDBは多くの選択肢が存在し、どれを使うべきか悩む方も多いのではないでしょうか？ \r\n\r\n本セッションでは、それぞれのローカルDBを設計思想・特徴・パフォーマンスの客観的に比較し、選定のヒントとなる基準を明確にしていきます。 \r\nさらに、各DBの登場背景やエコシステムとの関係性も比較し、なぜそのDBが選ばれるのか？を明らかにします。 \r\n\r\nこのトークを通して、あなたのFlutterプロジェクトに最適なローカルDBを選定するための「判断軸」を持ち帰っていただけることを目指します。 \r\n\r\nセッションで話すこと\r\n- ローカルDBの選択肢と比較\r\n- DB選定の判断軸\r\n- DB乗り換えの陥りやすい罠/シームレスに行う方法\r\n\r\n想定視聴者\r\n- FlutterでローカルDBを導入または乗り換えを検討している方',
      startsAt: DateTime(2025, 11, 21, 17, 45),
      endsAt: DateTime(2025, 11, 21, 17, 50),
      venue: _venues[3],
      speakers: [
        Speaker(
          id: 'akaboshinit',
          name: 'akaboshinit',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/d0757daa-4013-44b1-86fd-7a768352214d.jpg',
          ),
          xUrl: Uri.parse('https://x.com/akaboshinit'),
        ),
      ],
      isLightningTalk: true,
    ),
    Session(
      id: 'session34',
      title: 'FlutterにおけるFigma Dev Mode MCP活用Tips 5選',
      description:
          '## 概要\r\n\r\n昨今、 Claude Code をはじめとする AI ツールの登場により、アプリケーションの開発スタイルは大きく変化を遂げようとしています。\r\n\r\n特に、Claude CodeやFigma Dev Mode MCPを活用したコード生成が注目されています。\r\nしかし、FigmaのCode ConnectがFlutterに非対応である点や、生成されるコードの精度に課題がある点など、Flutterとの連携には課題があります。\r\n\r\n本LTでは、Figma MCPとClaude Codeを使って、より実用的なUI開発を行うためのTipsを5つご紹介します。\r\n\r\n## 想定視聴者\r\n\r\n- Flutterを用いてUI開発を行っている方\r\n- Figma・デザインシステムを活用したい方',
      startsAt: DateTime(2025, 11, 21, 17, 50),
      endsAt: DateTime(2025, 11, 21, 17, 55),
      venue: _venues[3],
      speakers: [
        Speaker(
          id: 'keigomichi',
          name: 'keigomichi',
          avatarUrl: Uri.parse(
            'https://fortee.jp/files/flutterkaigi-2025/speaker/d5415821-0405-42f9-ad4f-c22bf0d1d141.jpg',
          ),
          xUrl: Uri.parse('https://x.com/keigomichi'),
        ),
      ],
      isLightningTalk: true,
    ),

    /// ハンズオンセッション
    Session(
      id: 'session35',
      title: 'ハンズオンセッション',
      description:
          '## 概要\r\nFlutterKaigi 2025 ハンズオンでは、アプリの魅力を上げるため、UI にアニメーションやデコレーションを追加する基礎知識を学んでもらうことになりました。このハンズオンでは、単なる UI Widget カタログにならないよう、単純で飾り気のないベース模擬アプリに、デコレーションやアニメーションを追加していきます。アイテムの状態や状態変更に応じたアクションを返してくれますが、単純で飾り気のないベース模擬アプリにデコレーションやアニメーションを追加することで、アプリ表現力向上の比較とこれらの基礎知識を学んでもらう趣向となっております。\r\n## 備考\r\n- アーリーチケットでハンズオンセッションに参加希望を出した方のみ参加可能なセッションとなっております。',
      startsAt: DateTime(2025, 11, 21, 13, 30),
      endsAt: DateTime(2025, 11, 21, 15, 30),
      venue: _venues[3],
      isHandsOn: true,
    ),
  ];
}

@riverpod
Future<List<SessionVenue>> sessionVenues(Ref ref) async {
  return _venues;
}
