import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'individual_drafts.freezed.dart';
part 'individual_drafts.g.dart';

@freezed
abstract class IndividualDrafts with _$IndividualDrafts {
  const factory IndividualDrafts({
    required int id,
    required int individualId,
    required String name,
    required String slug,
    required String? logoName,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _IndividualDrafts;

  factory IndividualDrafts.fromJson(Map<String, dynamic> json) =>
      _$IndividualDraftsFromJson(json);
}

@freezed
abstract class IndividualDraftApprovals with _$IndividualDraftApprovals {
  const factory IndividualDraftApprovals({
    required int id,
    required int individualDraftId,
    // 承認したユーザがアカウントを削除した場合、nullになる
    required String? approvedById,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _IndividualDraftApprovals;

  factory IndividualDraftApprovals.fromJson(Map<String, dynamic> json) =>
      _$IndividualDraftApprovalsFromJson(json);
}
