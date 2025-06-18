import 'package:jaspr/jaspr.dart';

class StaffCard extends StatelessComponent {
  const StaffCard({
    required this.name,
    required this.role,
    required this.imageUrl,
    super.key,
  });

  final String name;
  final String role;
  final String imageUrl;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      styles: Styles(
        display: Display.flex,
        width: 300.px,
        padding: Spacing.all(1.rem),
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
      ),
      [
        div(
          styles: Styles(
            display: Display.flex,
            width: 100.px,
            height: 100.px,
            margin: Spacing.only(bottom: 1.rem),
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center,
            backgroundColor: const Color.rgba(200, 200, 200, 0.3),
            raw: {'border-radius': '50px'},
          ),
          [
            img(
              src: imageUrl,
              alt: 'Staff photo',
            ),
          ],
        ),
        p(
          styles: Styles(
            margin: Spacing.only(bottom: 0.5.rem),
            fontSize: 1.25.rem,
            fontWeight: FontWeight.w400,
            lineHeight: 2.rem,
          ),
          [
            Text(name),
          ],
        ),
        p(
          styles: Styles(
            margin: Spacing.only(bottom: 1.rem),
            color: const Color.rgba(0, 0, 0, 0.5),
            fontSize: 1.rem,
            lineHeight: 1.71.rem,
          ),
          [
            Text(role),
          ],
        ),
      ],
    );
  }
}
