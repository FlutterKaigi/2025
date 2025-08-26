import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sns_link_form_data.freezed.dart';

/// フォーム用のSNSリンク一時データ
@freezed
abstract class SnsLinkFormData with _$SnsLinkFormData {
  const factory SnsLinkFormData({
    SnsType? snsType,
    @Default('') String value,
  }) = _SnsLinkFormData;
}
