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
            textAlign: TextAlign.left,
            maxWidth: 800.px,
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
            flexDirection: FlexDirection.column,
            alignItems: AlignItems.center,
            gap: Gap.all(1.rem),
            margin: Spacing.only(bottom: 2.rem),
          ),
          [
            p(
              styles: Styles(
                color: Colors.black,
                fontSize: 1.125.rem,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                margin: Spacing.only(bottom: 0.5.rem),
              ),
              [
                contents.applyFromHere.text(context).toComponent,
              ],
            ),
            ul(
              styles: Styles(
                display: Display.flex,
                justifyContent: JustifyContent.center,
                gap: Gap(row: 2.rem, column: 1.rem),
                flexWrap: FlexWrap.wrap,
                listStyle: ListStyle.none,
                padding: Spacing.zero,
                margin: Spacing.zero,
              ),
              [
                for (final cfp in event.applyForCfp)
                  li([
                    Link(
                      to: cfp.url,
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
                        [cfp.title.text(context).toComponent],
                      ),
                    ),
                  ]),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
