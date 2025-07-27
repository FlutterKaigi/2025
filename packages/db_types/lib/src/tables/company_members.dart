import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_members.freezed.dart';
part 'company_members.g.dart';

@freezed
abstract class CompanyMembers with _$CompanyMembers {
  const factory CompanyMembers({
    required int companyId,
    required String userId,
    @RequiredDateTimeConverter() required DateTime joinedAt,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _CompanyMembers;

  factory CompanyMembers.fromJson(Map<String, dynamic> json) =>
      _$CompanyMembersFromJson(json);
}
