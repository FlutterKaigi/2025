import 'package:freezed_annotation/freezed_annotation.dart';

part 'sns_link_data.freezed.dart';
part 'sns_link_data.g.dart';

@freezed
abstract class SnsLinkData with _$SnsLinkData {
  const factory SnsLinkData({
    @JsonKey(name: 'sns_type') required String snsType,
    required String value,
  }) = _SnsLinkData;

  factory SnsLinkData.fromJson(Map<String, dynamic> json) =>
      _$SnsLinkDataFromJson(json);
}
