import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_member_with_sns_links.freezed.dart';
part 'staff_member_with_sns_links.g.dart';

@freezed
abstract class StaffMemberWithSnsLinks with _$StaffMemberWithSnsLinks {
  const factory StaffMemberWithSnsLinks({
    required String id,
    required String name,
    required String iconName,
    required String iconUrl,
    String? greeting,
    required List<SnsLink> snsLinks,
  }) = _StaffMemberWithSnsLinks;

  factory StaffMemberWithSnsLinks.fromJson(Map<String, dynamic> json) =>
      _$StaffMemberWithSnsLinksFromJson(json);
}

@freezed
abstract class SnsLink with _$SnsLink {
  const factory SnsLink({
    required SnsType type,
    required String value,
  }) = _SnsLink;

  factory SnsLink.fromJson(Map<String, dynamic> json) =>
      _$SnsLinkFromJson(json);
}

@freezed
abstract class StaffMemberListResponse with _$StaffMemberListResponse {
  const factory StaffMemberListResponse({
    required List<StaffMemberWithSnsLinks> staffMembers,
  }) = _StaffMemberListResponse;

  factory StaffMemberListResponse.fromJson(Map<String, dynamic> json) =>
      _$StaffMemberListResponseFromJson(json);
}
