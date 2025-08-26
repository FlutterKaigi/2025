import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:db_types/src/tables/profiles.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_sns_links.freezed.dart';
part 'user_sns_links.g.dart';

@freezed
abstract class UserSnsLinks with _$UserSnsLinks {
  const factory UserSnsLinks({
    required String id,
    required String userId,
    required SnsType snsType,
    required String value,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _UserSnsLinks;

  factory UserSnsLinks.fromJson(Map<String, dynamic> json) =>
      _$UserSnsLinksFromJson(json);
}

extension UserSnsLinksExtension on UserSnsLinks {
  /// UserSnsLinksからSnsAccountに変換
  SnsAccount toSnsAccount() {
    return SnsAccount(
      type: snsType,
      link: snsType.toUri(value),
    );
  }
}
