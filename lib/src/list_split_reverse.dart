import 'package:pop/pop.dart';

extension ListSplitReverse<E> on List<E> {
  /// Divides the list into left and right sub-lists, and then
  /// reverses them separately in-place.
  ///
  /// ```dart
  /// final values = [0, 1, 2, 3, 4, 5, 6]..splitReverse(4);
  /// // [0, 1, 2, 3, /* split here */ 4, 5, 6]
  /// print(values); // [3, 2, 1, 0, 6, 5, 4],
  /// ```
  ///
  /// When [n] is either 0 or [length], the list will be simply reversed.
  /// If you want to reverse in-place the entire list, prefer using
  /// the [reverse] method.
  ///
  /// Throws [RangeError] if [n] is less than 0 or greater than [length].
  void splitReverse(int n) => this
    ..reverse(0, n)
    ..reverse(n);
}
