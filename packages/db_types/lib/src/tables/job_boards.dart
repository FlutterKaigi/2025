import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_boards.freezed.dart';
part 'job_boards.g.dart';

@freezed
abstract class JobBoards with _$JobBoards {
  const factory JobBoards({
    required int id,
    required String url,
    required String altText,
    required String imageName,
  }) = _JobBoards;

  factory JobBoards.fromJson(Map<String, dynamic> json) =>
      _$JobBoardsFromJson(json);
}
