import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_share_response.freezed.dart';
part 'profile_share_response.g.dart';

@freezed
abstract class ProfileShareResponse with _$ProfileShareResponse {
  const factory ProfileShareResponse({
    required String message,
  }) = _ProfileShareResponse;

  factory ProfileShareResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileShareResponseFromJson(json);
}
