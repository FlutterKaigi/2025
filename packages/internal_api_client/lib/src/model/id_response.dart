import 'package:freezed_annotation/freezed_annotation.dart';

part 'id_response.freezed.dart';
part 'id_response.g.dart';

@freezed
abstract class IdResponse with _$IdResponse {
  const factory IdResponse({
    required String id,
  }) = _IdResponse;

  factory IdResponse.fromJson(Map<String, dynamic> json) =>
    _$IdResponseFromJson(json);
}
