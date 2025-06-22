import 'package:flutterkaigi_2025_website/src/components/staff_card.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:jaspr/jaspr.dart';

class Staff extends StatelessComponent {
  const Staff({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      styles: Styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        gap: Gap.all(1.rem),
      ),
      [
        div(
          styles: Styles(
            display: Display.flex,
            flexDirection: FlexDirection.row,
            flexWrap: FlexWrap.wrap,
            gap: Gap.all(2.rem),
            width: 100.percent,
            maxWidth: 1200.px,
            padding: Spacing.all(2.rem),
            justifyContent: JustifyContent.center,
          ),
          [
            for (final staff in event.staff) StaffCard(info: staff),
          ],
        ),
      ],
    );
  }
}
