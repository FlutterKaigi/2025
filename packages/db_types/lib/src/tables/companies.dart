import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'companies.freezed.dart';
part 'companies.g.dart';

@freezed
abstract class Companies with _$Companies {
  const factory Companies({
    required int id,
    required String name,
    required String logoName,
    @RequiredDateTimeConverter() required DateTime createdAt,
    @RequiredDateTimeConverter() required DateTime updatedAt,
  }) = _Companies;

  factory Companies.fromJson(Map<String, dynamic> json) =>
      _$CompaniesFromJson(json);
}
