import 'list_rotate.dart';
import 'range.dart';

extension ListRotated<E> on List<E> {
  /// Creates an [Iterable] with the rotated values.
  ///
  /// This method does not modify the original list, it returns a new [Iterable]
  /// (similarly how [reversed] returns an [Iterable].
  ///
  /// ```dart
  /// final values = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  /// // It returns an Iterable!
  /// print(values.rotated(3).take(4)); // [7, 8, 9, 1]
  ///
  /// // rotated doesn't modify the list!
  /// print(values); // It is still: [1, 2, 3, 4, 5, 6, 7, 8, 9]
  /// ```
  ///
  /// If you want to rotate in-place, use the [rotate] method.
  ///
  /// Positive [n] rotates to the right. Negative [n] rotates to the left.
  /// When [n % length] is equal to zero, the list will not be rotated.
  ///
  /// ```dart
  /// // right
  /// print([1, 2, 3, 4].rotated(1).toList()); // [4, 1, 2, 3]
  ///
  /// // left
  /// print([1, 2, 3, 4].rotated(-1).toList()); // [2, 3, 4, 1]
  ///
  /// // noop
  /// print([1, 2, 3, 4].rotated(4).toList()); // [1, 2, 3, 4]
  /// ```
  Iterable<E> rotated(int n) sync* {
    final length = this.length;
    for (final i in range(length)) {
      yield this[(i - n) % length];
    }
  }
}
