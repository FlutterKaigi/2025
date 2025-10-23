import 'package:db_types/db_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_share.freezed.dart';
part 'profile_share.g.dart';

@freezed
abstract class ProfileShare with _$ProfileShare {
  const factory ProfileShare({
    required String id,
    required String fromId,
    required String toId,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _ProfileShare;

  factory ProfileShare.fromJson(Map<String, dynamic> json) =>
      _$ProfileShareFromJson(json);
}
