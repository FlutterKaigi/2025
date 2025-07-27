import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_drafts.freezed.dart';
part 'company_drafts.g.dart';

@freezed
abstract class CompanyDrafts with _$CompanyDrafts {
  const factory CompanyDrafts({
    required int id,
    int? companyId,
    required String slug,
    required String description,
    required String websiteUrl,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _CompanyDrafts;

  factory CompanyDrafts.fromJson(Map<String, dynamic> json) =>
      _$CompanyDraftsFromJson(json);
}

@freezed
abstract class CompanyDraftApprovals with _$CompanyDraftApprovals {
  const factory CompanyDraftApprovals({
    required int id,
    required int companyDraftId,
    // 承認したユーザがアカウントを削除した場合、nullになる
    required String? approvedBy,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _CompanyDraftApprovals;

  factory CompanyDraftApprovals.fromJson(Map<String, dynamic> json) =>
      _$CompanyDraftApprovalsFromJson(json);
}
