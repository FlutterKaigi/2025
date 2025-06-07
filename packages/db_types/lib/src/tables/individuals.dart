import 'package:freezed_annotation/freezed_annotation.dart';

part 'individuals.freezed.dart';
part 'individuals.g.dart';

@freezed
abstract class Individuals with _$Individuals {
  const factory Individuals({
    required int id,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Individuals;

  factory Individuals.fromJson(Map<String, dynamic> json) =>
      _$IndividualsFromJson(json);
}
