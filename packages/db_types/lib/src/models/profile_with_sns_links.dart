import 'package:db_types/src/tables/profiles.dart';
import 'package:db_types/src/tables/user_sns_links.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_with_sns_links.freezed.dart';
part 'profile_with_sns_links.g.dart';

@freezed
abstract class ProfileWithSnsLinks with _$ProfileWithSnsLinks {
  const factory ProfileWithSnsLinks({
    required Profiles profile,
    required List<UserSnsLinks> snsLinks,
    required String? avatarUrl,
  }) = _ProfileWithSnsLinks;

  factory ProfileWithSnsLinks.fromJson(Map<String, dynamic> json) =>
      _$ProfileWithSnsLinksFromJson(json);
}
