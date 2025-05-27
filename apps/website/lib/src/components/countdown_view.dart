import 'dart:async';

import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:jaspr/jaspr.dart';

@client
class CountdownView extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => _CountdownState();
}

class _CountdownState extends State<CountdownView> {
  final _targetDate = event.date;
  Duration _remainingTime = Duration.zero;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      return;
    }
    _updateRemainingTime();
    final now = DateTime.now();
    final millisToNextSecond = 1000 - now.millisecond;
    Timer(Duration(milliseconds: millisToNextSecond), () {
      _updateRemainingTime();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _updateRemainingTime();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void _updateRemainingTime() {
    if (kIsWeb) {
      final now = DateTime.now();
      setState(() {
        _remainingTime = _targetDate.difference(now) + Duration(seconds: 1);
      });
    }
  }

  String get remainingTimeString => '${_remainingTime.inHours.remainder(24)}:'
      '${(_remainingTime.inMinutes.remainder(60)).toString().padLeft(2, '0')}:'
      '${(_remainingTime.inSeconds.remainder(60)).toString().padLeft(2, '0')}';

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'bubble',
      styles: Styles(
        margin: Spacing.only(top: 8.rem),
      ),
      [
        div(
          styles: Styles(
            fontFamily: lexendFontFamily,
          ),
          [
            span(
              styles: Styles(
                display: Display.inlineFlex,
                alignItems: AlignItems.baseline,
                fontSize: 0.9.rem,
                margin: Spacing.only(right: 1.rem),
                gap: Gap.all(0.5.rem),
              ),
              [
                span(
                  styles: Styles(
                    color: Color.variable('--secondary-color'),
                    fontSize: 2.rem,
                  ),
                  [text(_remainingTime.inDays.toString())],
                ),
                text('days'),
              ],
            ),
            span(
              styles: Styles(
                color: Color.variable('--secondary-color'),
                fontSize: 2.rem,
              ),
              [text(remainingTimeString)],
            )
          ],
        ),
      ],
    );
  }
}
