import 'package:freezed_annotation/freezed_annotation.dart';

part 'put_checkout_session_response.freezed.dart';
part 'put_checkout_session_response.g.dart';

@freezed
abstract class PutCheckoutSessionResponse with _$PutCheckoutSessionResponse {
  const factory PutCheckoutSessionResponse({
    required String id,
    required String url,
    required DateTime expiresAt,
    required String status,
    required String customerEmail,
    required Map<String, dynamic> session,
  }) = _PutCheckoutSessionResponse;

  factory PutCheckoutSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$PutCheckoutSessionResponseFromJson(json);
}
