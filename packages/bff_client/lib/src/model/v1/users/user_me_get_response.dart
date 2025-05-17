import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_me_get_response.freezed.dart';
part 'user_me_get_response.g.dart';

@freezed
abstract class UserMeGetResponse with _$UserMeGetResponse {
  const factory UserMeGetResponse({
    required Users user,
  }) = _UserMeGetResponse;

  factory UserMeGetResponse.fromJson(Map<String, dynamic> json) =>
    _$UserMeGetResponseFromJson(json);
}
