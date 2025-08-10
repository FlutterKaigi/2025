import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profiles.freezed.dart';
part 'profiles.g.dart';

@freezed
abstract class Profiles with _$Profiles {
  const factory Profiles({
    required String id,
    required String name,
    required String comment,
    required bool isAdult,
    String? avatarKey,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _Profiles;

  factory Profiles.fromJson(Map<String, dynamic> json) =>
      _$ProfilesFromJson(json);
}

enum SnsType { x, github, facebook, instagram, linkedin, youtube, tiktok, website }