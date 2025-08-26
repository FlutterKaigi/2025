import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_object_request.freezed.dart';
part 'delete_object_request.g.dart';

@freezed
abstract class DeleteObjectRequest with _$DeleteObjectRequest {
  const factory DeleteObjectRequest({
    required String key,
  }) = _DeleteObjectRequest;

  factory DeleteObjectRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteObjectRequestFromJson(json);
}
