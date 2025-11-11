import 'dart:convert';

import 'package:db_types/db_types.dart';
import 'package:flutterkaigi_2025_website/src/config/staffs_data.json.dart'
    show staffsDataJson;

// このファイルはビルド時に生成されたJSONファイルを読み込んでパースします
// JSONファイルの内容は staffs_data.json.dart として別途生成されます

// JSONデータをパースしてキャッシュ
final _jsonData = jsonDecode(staffsDataJson) as List<dynamic>;
final _staffMembers = _jsonData
    .map((e) => StaffMemberWithSnsLinks.fromJson(e as Map<String, dynamic>))
    .toList();

/// スタッフメンバーのリスト
final List<StaffMemberWithSnsLinks> staffMembers = _staffMembers;
