import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_invitation.freezed.dart';
part 'company_invitation.g.dart';

@freezed
abstract class CompanyInvitation with _$CompanyInvitation {
  const factory CompanyInvitation({
    required int companyId,
    required String key,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
    @DateTimeConverter() required DateTime? disabledAt,
  }) = _CompanyInvitation;

  factory CompanyInvitation.fromJson(Map<String, dynamic> json) =>
      _$CompanyInvitationFromJson(json);
}
