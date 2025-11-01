import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_board.freezed.dart';
part 'job_board.g.dart';

/// Job Board（求人情報）API レスポンスモデル
@freezed
abstract class JobBoard with _$JobBoard {
  const factory JobBoard({
    required int id,
    required String url,
    required String altText,
    required String imageUrl,
  }) = _JobBoard;

  factory JobBoard.fromJson(Map<String, dynamic> json) =>
      _$JobBoardFromJson(json);
}
