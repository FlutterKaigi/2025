import 'package:flutterkaigi_2025_website/src/components/sized_dashsay.dart';
import 'package:jaspr/jaspr.dart';

class Dashsay extends StatelessComponent {
  const Dashsay({required this.message, super.key});

  final String message;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield SizedDashsay(message: message);
  }
}
