import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';

class ScheduleView extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'dl',
      styles: Styles(
        display: Display.grid,
        margin: Spacing.only(top: 1.rem, bottom: 4.rem),
        gridTemplate: const GridTemplate(
          columns: GridTracks([
            GridTrack.repeat(TrackRepeat(2), [GridTrack(TrackSize.fr(1))]),
          ]),
        ),
        gap: Gap.all(0.5.rem),
      ),
      children: [
        ...event.schedule
            .map(
              (schedule) => [
                DomComponent(
                  tag: 'dt',
                  styles: Styles(
                    textAlign: TextAlign.center,
                    lineHeight: 2.rem,
                  ),
                  child: text(formatDate(schedule.date)),
                ),
                DomComponent(
                  tag: 'dd',
                  child: text(schedule.title.text),
                ),
              ],
            )
            .expand((e) => e),
      ],
    );
  }
}
