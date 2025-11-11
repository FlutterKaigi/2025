import 'package:flutterkaigi_2025_website/src/components/job_boards.dart'
    as component;
import 'package:flutterkaigi_2025_website/src/components/section_layout.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';

class JobBoards extends StatelessComponent {
  const JobBoards({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield main_(
      classes: 'main-background',
      styles: Styles(
        display: Display.flex,
        padding: Padding.symmetric(horizontal: 32.px),
        overflow: Overflow.hidden,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
        gap: Gap.all(2.rem),
        flex: const Flex(grow: 1),
      ),
      [
        SectionLayout(
          id: 'job-boards',
          title: 'Job Boards'.toComponent,
          children: [component.JobBoards()],
        ),
      ],
    );
  }
}
