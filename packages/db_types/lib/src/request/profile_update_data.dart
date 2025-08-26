import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_update_data.freezed.dart';
part 'profile_update_data.g.dart';

@freezed
abstract class ProfileUpdateData with _$ProfileUpdateData {
  const factory ProfileUpdateData({
    String? name,
    String? comment,
    bool? isAdult,
    String? avatarKey,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ProfileUpdateData;

  factory ProfileUpdateData.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateDataFromJson(json);
}
