import 'package:bff_client/src/model/v1/profile/sns_link.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

@freezed
abstract class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    required Profiles profile,
    required List<SnsLink> snsLinks,
    required bool canEditNameplate,
    String? nameplateNote,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@freezed
abstract class Profiles with _$Profiles {
  const factory Profiles({
    required String id,
    required String name,
    required String comment,
    required bool isAdult,
    required DateTime createdAt,
    required DateTime updatedAt,
    required Uri? avatarUrl,
  }) = _Profiles;

  factory Profiles.fromJson(Map<String, dynamic> json) =>
      _$ProfilesFromJson(json);
}
