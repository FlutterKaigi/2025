import 'package:freezed_annotation/freezed_annotation.dart';

part 'put_checkout_sesson_request.freezed.dart';
part 'put_checkout_sesson_request.g.dart';

@freezed
abstract class PutCheckoutSessonRequest with _$PutCheckoutSessonRequest {
  const factory PutCheckoutSessonRequest({
    required String successUrl,
    required String cancelUrl,
    required String userId,
    required String ticketTypeId,
    required List<String> ticketOptionIds,
  }) = _PutCheckoutSessonRequest;

  factory PutCheckoutSessonRequest.fromJson(Map<String, dynamic> json) =>
      _$PutCheckoutSessonRequestFromJson(json);
}
