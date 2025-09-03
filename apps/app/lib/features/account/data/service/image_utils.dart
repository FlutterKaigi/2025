import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;

/// 画像変換のユーティリティクラス
class ImageUtils {
  /// 画像を400x400のWebPに変換する
  static Future<Uint8List> convertToWebP400({
    required Uint8List imageBytes,
  }) async {
    // 画像をデコード
    final originalImage = img.decodeImage(imageBytes);
    if (originalImage == null) {
      throw const FormatException('画像のデコードに失敗しました');
    }

    // 400x400にリサイズ（アスペクト比を保持してクロップ）
    final resizedImage = img.copyResizeCropSquare(originalImage, size: 400);

    // WebPにエンコード
    final webpBytes = img.encodeWebP(resizedImage);
    return Uint8List.fromList(webpBytes);
  }

  /// ネットワーク画像を400x400のWebPに変換する
  static Future<Uint8List> convertNetworkImageToWebP400({
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
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.data == null) {
        throw Exception('画像データの取得に失敗しました');
      }

      final bytes = Uint8List.fromList(response.data!);
      return await convertToWebP400(imageBytes: bytes);
    } catch (e) {
      throw Exception('ネットワーク画像の取得に失敗しました: $e');
    }
  }

  /// クロップされた画像を400x400のWebPに変換する
  static Future<Uint8List> convertCroppedImageToWebP400({
    required Uint8List croppedBytes,
  }) async {
    return convertToWebP400(imageBytes: croppedBytes);
  }
}
