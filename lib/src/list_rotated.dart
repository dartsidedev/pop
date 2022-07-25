import 'package:pop/src/list_rotate.dart';

extension ListRotated<E> on List<E> {
  /// Creates a new list with the rotated values.
  ///
  /// This method does not modify the original list, it returns a new list.
  /// If you want to rotate in-place, use the [rotate] method.
  ///
  /// The created list is fixed-length if [growable] is set to `false`.
  ///
  /// Positive [n] rotates to the right. Negative [n] rotates to the left.
  /// When [n] is equal to zero, the list will not be rotated.
  ///
  /// ```dart
  /// print([1, 2, 3, 4].rotated(1)); // [4, 1, 2, 3]
  /// print([1, 2, 3, 4].rotated(-1)); // [2, 3, 4, 1]
  /// ```
  List<E> rotated(
    int n, {
    bool growable = true,
  }) {
    return List.generate(
      length,
      (i) => this[(i - n) % length],
      growable: growable,
    );
  }
}
