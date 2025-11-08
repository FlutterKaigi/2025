import 'dart:convert';

import 'package:db_types/db_types.dart';
import 'package:flutterkaigi_2025_website/src/config/sponsors_data.json.dart'
    show sponsorsDataJson;

// このファイルはビルド時に生成されたJSONファイルを読み込んでパースします
// JSONファイルの内容は sponsors_data.json.dart として別途生成されます

// JSONデータをパースしてキャッシュ
final _jsonData = jsonDecode(sponsorsDataJson) as Map<String, dynamic>;
final _sponsorSummary = SponsorSummary.fromJson(_jsonData);

/// 企業スポンサーのリスト
final List<CompanySponsorDetail> companySponsors =
    _sponsorSummary.companySponsors;

/// 個人スポンサーのリスト
final List<IndividualSponsorDetail> individualSponsors =
    _sponsorSummary.individualSponsors;
