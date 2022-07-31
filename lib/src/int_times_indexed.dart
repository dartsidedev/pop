extension IntTimesIndexed on int {
  /// Calls the [fn] [this] many times with the current iteration index.
  ///
  /// ```dart
  /// var counter = 0;
  /// 4.timesIndexed((i) => counter += i); // 0 + 1 + 2 + 3
  /// print(counter); // 6
  /// ```
  ///
  /// For non-positive numbers (so zero and negative numbers), the [fn]
  /// will not be called.
  ///
  /// This method might change later to support return values.
  void timesIndexed<T>(void Function(int i) fn) {
    var i = 0;
    while (i < this) {
      fn(i);
      i++;
    }
  }
}
