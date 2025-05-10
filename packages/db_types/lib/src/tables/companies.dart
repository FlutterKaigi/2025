import 'package:freezed_annotation/freezed_annotation.dart';

part '../model/companies.freezed.dart';
part '../model/companies.g.dart';

@freezed
abstract class Companies with _$Companies {
  const factory Companies({
    required int id,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Companies;

  factory Companies.fromJson(Map<String, dynamic> json) =>
    _$CompaniesFromJson(json);
}
