enum ScreenSize {
  small,
  medium,
  large;

  factory ScreenSize.fromWidth(double width) {
    return switch (width) {
      > 840 => ScreenSize.large,
      > 600 => ScreenSize.medium,
      _ => ScreenSize.small,
    };
  }
}
