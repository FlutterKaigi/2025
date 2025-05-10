import 'package:freezed_annotation/freezed_annotation.dart';

part 'users.freezed.dart';
part 'users.g.dart';

@freezed
abstract class Users with _$Users {
  const factory Users({required String id, required DateTime createdAt}) =
      _Users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}
