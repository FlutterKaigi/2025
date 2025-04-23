import 'package:web/web.dart';
import 'package:flutterkaigi_2025_website/app.dart';

void main() {
  final element = document.querySelector('dart-web') as HTMLElement;
  element.replaceWith(app);
}
