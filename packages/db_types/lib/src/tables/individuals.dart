import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'individuals.freezed.dart';
part 'individuals.g.dart';

@freezed
abstract class Individuals with _$Individuals {
  const factory Individuals({
    required int id,
    required String userId,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _Individuals;

  factory Individuals.fromJson(Map<String, dynamic> json) =>
      _$IndividualsFromJson(json);
}
