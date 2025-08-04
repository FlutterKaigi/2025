import 'package:freezed_annotation/freezed_annotation.dart';

part 'put_checkout_session_request.freezed.dart';
part 'put_checkout_session_request.g.dart';

@freezed
abstract class PutCheckoutSessionRequest with _$PutCheckoutSessionRequest {
  const factory PutCheckoutSessionRequest({
    required String successUrl,
    required String cancelUrl,
    required String userId,
    required String ticketTypeId,
    required List<String> ticketOptionIds,
  }) = _PutCheckoutSessionRequest;

  factory PutCheckoutSessionRequest.fromJson(Map<String, dynamic> json) =>
      _$PutCheckoutSessionRequestFromJson(json);
}
