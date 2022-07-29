extension ListAddFirst<E> on List<E> {
  /// Adds [value] to the start of this list,
  /// extending the length by one.
  ///
  /// The list must be growable.
  ///
  /// ```dart
  /// final numbers = <int>[1, 2, 3];
  /// numbers.addFirst(0);
  /// print(numbers); // [0, 1, 2, 3]
  /// ```
  ///
  /// For fixed length lists, this method throws [UnsupportedError].
  void addFirst(E value) => insert(0, value);
}
