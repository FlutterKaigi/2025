import 'package:bff_client/bff_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_update_request.freezed.dart';
part 'profile_update_request.g.dart';

@freezed
abstract class ProfileUpdateRequest with _$ProfileUpdateRequest {
  const factory ProfileUpdateRequest({
    String? name,
    String? comment,
    bool? isAdult,
    List<SnsLink>? snsLinks,
    String? avatarKey,
  }) = _ProfileUpdateRequest;

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateRequestFromJson(json);
}
