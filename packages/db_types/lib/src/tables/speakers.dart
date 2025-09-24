import 'package:freezed_annotation/freezed_annotation.dart';

part 'speakers.freezed.dart';
part 'speakers.g.dart';

@freezed
abstract class Speakers with _$Speakers {
  const factory Speakers({
    required String id,
    required String name,
    String? avatarName,
    String? xId,
  }) = _Speakers;

  factory Speakers.fromJson(Map<String, dynamic> json) =>
      _$SpeakersFromJson(json);
}
