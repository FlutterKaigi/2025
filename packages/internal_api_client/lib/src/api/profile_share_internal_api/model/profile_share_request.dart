import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_share_request.freezed.dart';
part 'profile_share_request.g.dart';

@freezed
abstract class ProfileShareRequest with _$ProfileShareRequest {
  const factory ProfileShareRequest({
    required String profileId,
    required String anotherProfileId,
  }) = _ProfileShareRequest;

  factory ProfileShareRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileShareRequestFromJson(json);
}
