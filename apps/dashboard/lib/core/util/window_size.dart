enum WindowSize {
  compact,
  medium,
  expanded;

  factory WindowSize.fromWidth(double width) {
    return switch (width) {
      > 840 => WindowSize.expanded,
      > 600 => WindowSize.medium,
      _ => WindowSize.compact,
    };
  }
}
