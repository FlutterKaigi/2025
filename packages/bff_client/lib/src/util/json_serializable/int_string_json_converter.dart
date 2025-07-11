import 'package:freezed_annotation/freezed_annotation.dart';

class IntStringJsonConverter extends JsonConverter<int, String> {
  const IntStringJsonConverter();

  @override
  int fromJson(String json) => int.parse(json);

  @override
  String toJson(int object) => object.toString();
}
