import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_option.freezed.dart';
part 'checkout_option.g.dart';

@freezed
abstract class CheckoutOption with _$CheckoutOption {
  const factory CheckoutOption({
    required String optionId,
    required String value,
  }) = _CheckoutOption;

  factory CheckoutOption.fromJson(Map<String, dynamic> json) =>
      _$CheckoutOptionFromJson(json);

  /// TicketOptionRequestから変換
  factory CheckoutOption.fromOptionRequest(Map<String, String?> option) {
    return CheckoutOption(
      optionId: option['optionId']!,
      value: option['value']!,
    );
  }
}
