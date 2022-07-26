extension IntTimes on int {
  /// Calls the [fn] [this] many times.
  ///
  /// ```dart
  /// var counter = 0;
  /// 5.times(() => counter++);
  /// print(counter); // 5
  /// ```
  ///
  /// For non-positive numbers (so zero and negative numbers), the [fn]
  /// will not be called.
  ///
  /// This method might change later to support return values.
  void times<T>(void Function() fn) {
    var i = 0;
    while(i < this) {
      fn();
      i++;
    }
  }
}