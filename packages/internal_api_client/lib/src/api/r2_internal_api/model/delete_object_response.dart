import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_object_response.freezed.dart';
part 'delete_object_response.g.dart';

@freezed
abstract class DeleteObjectResponse with _$DeleteObjectResponse {
  const factory DeleteObjectResponse({
    required bool success,
  }) = _DeleteObjectResponse;

  factory DeleteObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteObjectResponseFromJson(json);
}