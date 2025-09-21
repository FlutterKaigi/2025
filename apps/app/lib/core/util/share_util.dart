import 'package:url_launcher/url_launcher.dart';

class ShareUtil {
  ShareUtil._();

  /// Xでシェアする
  static Future<void> shareToX({
    required String text,
    required String url,
    required String hashtags,
    String? via,
  }) async {
    final uri = Uri.https(
      'x.com',
      'intent/tweet',
      {
        'text': text,
        'url': url,
        'hashtags': hashtags,
        if (via != null) 'via': via,
      },
    );
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
