import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_get_response.freezed.dart';
part 'user_get_response.g.dart';

@freezed
abstract class UserGetResponse with _$UserGetResponse {
  const factory UserGetResponse({
    required Users user,
    required List<Role> roles,
  }) = _UserGetResponse;

  factory UserGetResponse.fromJson(Map<String, dynamic> json) =>
      _$UserGetResponseFromJson(json);
}
