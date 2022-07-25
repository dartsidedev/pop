import 'package:pop/src/list_reverse.dart';
import 'package:pop/src/list_split_reverse.dart';

extension ListRotate<E> on List<E> {
  /// Rotates the list by [n].
  ///
  /// Important: this method modifies the original list. If you don't want to
  /// modify the list, use the [rotated] method.
  ///
  /// The [rotate] method takes the modulo [length] on [n], so it will not
  /// rotate needlessly.
  ///
  /// Positive [n] rotates to the right. Negative [n] rotates to the left.
  /// When [n] is equal to zero, the list will not be rotated.
  ///
  /// ```dart
  /// print([1, 2, 3, 4]..rotate(1)); // [4, 1, 2, 3]
  /// print([1, 2, 3, 4]..rotate(-1)); // [2, 3, 4, 1]
  /// ```
  ///
  /// Rotating [n] to the right is equivalent to rotating [length - n] to the
  /// left:
  ///
  /// ```dart
  /// final list1 = [0, 1, 2, 3, 4, 5, 6];
  /// final list2 = [...list1]; // just a copy
  ///
  /// final length = list1.length;
  ///
  /// print(list1..rotate(2)); // [5, 6, 0, 1, 2, 3, 4]
  /// print(list2..rotate(-(length - 2)); // [5, 6, 0, 1, 2, 3, 4]
  /// ```
  void rotate(int n) {
    n = n % length;
    if (n == 0) return;
    this
      ..reverse()
      ..splitReverse(n);
  }
}
