import 'package:bff_client/bff_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_with_sns.freezed.dart';
part 'profile_with_sns.g.dart';

@freezed
abstract class ProfileWithSns with _$ProfileWithSns {
  const factory ProfileWithSns({
    required Profiles profile,
    required List<SnsLink> snsLinks,
  }) = _ProfileWithSns;

  factory ProfileWithSns.fromJson(Map<String, dynamic> json) =>
      _$ProfileWithSnsFromJson(json);
}
