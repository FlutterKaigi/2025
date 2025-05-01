import 'package:flutterkaigi_2025_website/app.dart';
import 'package:web/web.dart';

void main() {
  final element = document.querySelector('dart-web')! as HTMLElement;
  element.replaceWith(app);
}
