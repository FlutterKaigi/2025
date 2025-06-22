import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class CallForProposal extends StatelessComponent {
  const CallForProposal({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      styles: Styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        gap: Gap.all(1.5.rem),
      ),
      [
        p(
          styles: Styles(
            color: Colors.black,
            fontSize: 1.rem,
            fontWeight: FontWeight.w400,
            lineHeight: 180.percent,
          ),
          [
            Text(contents.proposalContents.text(context)),
          ],
        ),
        div(
          styles: Styles(
            display: Display.flex,
            position: const Position.relative(),
            width: 100.percent,
            margin: Spacing.only(bottom: 2.rem),
            justifyContent: JustifyContent.center,
          ),
          [
            Link(
              to: event.applyForCfp.url.text(context),
              child: button(
                styles: Styles(
                  position: const Position.relative(),
                  width: 240.px,
                  padding: Spacing.all(1.rem),
                  cursor: Cursor.pointer,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                  fontSize: 1.rem,
                ),
                classes: 'primary-button',
                [event.applyForCfp.title.text(context).toComponent],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
