/// Window size breakpoints
enum WindowSize {
  compact(0, 600),
  medium(600, 1240),
  expanded(1240, double.infinity);

  const WindowSize(this.min, this.max);

  final double min;
  final double max;

  static WindowSize fromWidth(double width) {
    if (width < medium.min) return compact;
    if (width < expanded.min) return medium;
    return expanded;
  }
}