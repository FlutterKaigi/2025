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
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        padding: Spacing.all(1.rem),
        width: 300.px,
      ),
      [
        div(
          classes: 'staff-card-avatar',
          [
            img(
              src: imageUrl,
              alt: 'Staff photo',
            ),
          ],
        ),
        div(
          styles: Styles(
            fontSize: 1.25.rem,
            lineHeight: 2.rem,
            fontWeight: FontWeight.w400,
            margin: Spacing.only(bottom: 0.5.rem),
          ),
          [Text(name)],
        ),
        div(
          styles: Styles(
            fontSize: 1.rem,
            lineHeight: 1.71.rem,
            color: const Color.rgba(0, 0, 0, 0.5),
            margin: Spacing.only(bottom: 1.rem),
          ),
          [Text(role)],
        ),
      ],
    );
  }
}
