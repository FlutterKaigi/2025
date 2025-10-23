import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_share_count_response.freezed.dart';
part 'profile_share_count_response.g.dart';

@freezed
abstract class ProfileShareCountResponse with _$ProfileShareCountResponse {
  const factory ProfileShareCountResponse({
    required int count,
  }) = _ProfileShareCountResponse;

  factory ProfileShareCountResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileShareCountResponseFromJson(json);
}
