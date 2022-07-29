extension ListRemoveFirst<E> on List<E> {
  /// Removes and returns the first object in this list.
  ///
  /// The list must be growable and non-empty.
  ///
  /// ```dart
  /// final parts = ['head', 'shoulder', 'knees', 'toes'];
  /// final value = parts.removeFirst(); // head
  /// print(parts); // [shoulder, knees, toes]
  /// ```
  ///
  /// When called on a non-growable list, it throws [UnsupportedError].
  /// When called on an empty list, it throws [RangeError].
  E removeFirst() => removeAt(0);
}
