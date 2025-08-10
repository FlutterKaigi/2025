import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_update_request.freezed.dart';
part 'profile_update_request.g.dart';

@freezed
abstract class SnsLinkRequest with _$SnsLinkRequest {
  const factory SnsLinkRequest({
    required SnsType snsType,
    required String value,
  }) = _SnsLinkRequest;

  factory SnsLinkRequest.fromJson(Map<String, dynamic> json) =>
      _$SnsLinkRequestFromJson(json);
}

@freezed
abstract class ProfileUpdateRequest with _$ProfileUpdateRequest {
  const factory ProfileUpdateRequest({
    String? name,
    String? comment,
    bool? isAdult,
    List<SnsLinkRequest>? snsLinks,
  }) = _ProfileUpdateRequest;

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateRequestFromJson(json);
}