import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_invitation.freezed.dart';
part 'company_invitation.g.dart';

@freezed
abstract class CompanyInvitation with _$CompanyInvitation {
  const factory CompanyInvitation({
    required int companyId,
    required String key,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime? disabledAt,
  }) = _CompanyInvitation;

  factory CompanyInvitation.fromJson(Map<String, dynamic> json) =>
    _$CompanyInvitationFromJson(json);
}
