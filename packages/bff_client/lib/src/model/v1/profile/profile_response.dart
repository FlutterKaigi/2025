import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

@freezed
abstract class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    required Profiles profile,
    required List<UserSnsLinks> snsLinks,
    required bool canEditNameplate,
    String? nameplateNote,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
