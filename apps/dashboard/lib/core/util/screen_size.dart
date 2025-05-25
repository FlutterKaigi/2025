enum ScreenSize {
  small,
  medium,
  large;

  factory ScreenSize.fromWidth(double width) {
    return switch (width) {
      > 960 => ScreenSize.large,
      > 640 => ScreenSize.medium,
      _ => ScreenSize.small,
    };
  }
}
