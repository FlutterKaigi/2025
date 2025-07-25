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
            maxWidth: 800.px,
            color: Colors.black,
            textAlign: TextAlign.left,
            fontSize: 1.rem,
            fontWeight: FontWeight.w400,
            lineHeight: 180.percent,
          ),
          [
            for (final part
                in contents.proposalContents.text(context).split('\n')) ...[
              Text(part),
              if (part !=
                  contents.proposalContents.text(context).split('\n').last)
                br(),
            ],
          ],
        ),
        div(
          styles: Styles(
            display: Display.flex,
            margin: Spacing.only(bottom: 2.rem),
            flexDirection: FlexDirection.column,
            alignItems: AlignItems.center,
            gap: Gap.all(1.rem),
          ),
          [
            Link(
              to: event.cfp.url,
              child: button(
                styles: Styles(
                  display: Display.flex,
                  position: const Position.relative(),
                  cursor: Cursor.pointer,
                  justifyContent: JustifyContent.center,
                  gap: Gap.all(1.rem),
                  color: Colors.white,
                  fontSize: 1.rem,
                ),
                classes: 'primary-button',
                [
                  event.cfp.title.text(context).toComponent,
                  img(src: '/img/icon/open-in-new.svg'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
