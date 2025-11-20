import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_utils.g.dart';

@Riverpod(keepAlive: true)
ImageUtils imageUtils(Ref ref) => const ImageUtils._();

class ImageUtils {
  const ImageUtils._();

  /// 画像を400x400のPngに変換する
  Future<Uint8List> convertToPng400({
    required Uint8List imageBytes,
  }) async {
    // 画像をデコード
    final originalImage = img.decodeImage(imageBytes);
    if (originalImage == null) {
      throw const FormatException('画像のデコードに失敗しました');
    }

    // 400x400にリサイズ（アスペクト比を保持してクロップ）
    final resizedImage = img.copyResizeCropSquare(originalImage, size: 400);

    // PNGにエンコード
    final pngBytes = img.encodePng(resizedImage);
    return Uint8List.fromList(pngBytes);
  }

  /// ネットワーク画像を400x400のPNGに変換する
  Future<Uint8List> convertNetworkImageToPng400({
    required String imageUrl,
  }) async {
    try {
      // Dioを使ってネットワーク画像を取得
      final dio = Dio();
      final response = await dio.get<List<int>>(
        imageUrl,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: true,
        ),
      );

      if (response.data == null) {
        throw Exception('画像データの取得に失敗しました');
      }

      final bytes = Uint8List.fromList(response.data!);
      return await convertToPng400(imageBytes: bytes);
    } catch (e) {
      throw Exception('ネットワーク画像の取得に失敗しました: $e');
    }
  }
}
