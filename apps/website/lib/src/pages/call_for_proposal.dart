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
        gap: Gap.all(1.rem),
      ),
      [
        p(
          styles: Styles(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            whiteSpace: WhiteSpace.preLine,
            fontSize: 0.875.rem,
            lineHeight: 180.percent,
          ),
          [
            Text(contents.proposalContents.text(context)),
          ],
        ),
        div(
          styles: Styles(
            display: Display.flex,
            justifyContent: JustifyContent.center,
            width: 100.percent,
            margin: Spacing.only(bottom: 2.rem),
            position: const Position.relative(),
          ),
          [
            Link(
              to: event.applyForCfp.url.text(context),
              classes: 'gradient-button',
              styles: Styles(
                cursor: Cursor.pointer,
                color: Colors.white,
                fontSize: 1.rem,
                padding: Spacing.all(1.rem),
                textAlign: TextAlign.center,
                width: 240.px,
                position: const Position.relative(),
              ),
              child: event.applyForCfp.title.text(context).toComponent,
            ),
          ],
        ),
      ],
    );
  }
}
