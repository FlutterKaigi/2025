import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_intent.freezed.dart';
part 'payment_intent.g.dart';

@freezed
abstract class PaymentIntent with _$PaymentIntent {
  const factory PaymentIntent({
    required String id,
    required String clientSecret,
    required int amount,
    required String currency,
    required String status,
    String? customerId,
    Map<String, dynamic>? metadata,
  }) = _PaymentIntent;

  factory PaymentIntent.fromJson(Map<String, dynamic> json) =>
      _$PaymentIntentFromJson(json);
}
