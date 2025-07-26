import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stripe_webhook_logs.freezed.dart';
part 'stripe_webhook_logs.g.dart';

@freezed
abstract class StripeWebhookLogs with _$StripeWebhookLogs {
  const factory StripeWebhookLogs({
    required int id,
    required String stripeEventId,
    required String eventType,
    String? paymentIntentId,
    required bool processed,
    String? errorMessage,
    required Map<String, dynamic> rawData,
    @RequiredDateTimeConverter() required DateTime createdAt,
  }) = _StripeWebhookLogs;

  factory StripeWebhookLogs.fromJson(Map<String, dynamic> json) =>
      _$StripeWebhookLogsFromJson(json);
}
