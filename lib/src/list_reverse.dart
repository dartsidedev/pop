import 'dart:math';

import 'package:pop/src/list_swap.dart';
import 'package:pop/src/range.dart';

extension ListReverse<T> on List<T> {
  /// Reverses the list in-place.
  ///
  /// If receiving a new [Iterable] (as opposed to reversing in place) is
  /// acceptable, use Dart's [reversed] getter on the [List].
  ///
  /// You may optionally specify the range where you want to reverse in the
  /// list.
  ///
  /// If neither [start] or [end] is specified, this method reverses the
  /// entire list.
  ///
  /// ```dart
  /// final values = [1, 2, 3, 4, 5];
  /// values.reverse();
  /// print(values); // [5, 4, 3, 2, 1]
  /// ```
  ///
  /// [start] will default to `0`, and [end] will default to [length],
  /// so if only the [start] is set, the list from [start] until the end of the
  /// list will be reversed:
  ///
  /// ```dart
  /// final values = [0, 1, 2, 3, 4]..reverse(2)
  /// print(values); // [0, 1, 4, 3, 2]
  /// ```
  ///
  /// [start] is included and [end] is excluded from the reversal:
  ///
  /// ```dart
  /// final values = [0, 1, 2, 3]..reverse(1, 3);
  /// print(values); // [0, 2, 1, 3]
  /// ```
  ///
  /// `reverse(a, b)` is equivalent to `reverse(b, a)` and they will modify the
  /// list the same:
  ///
  /// ```dart
  /// [0, 1, 2, 3, 4, 5]..reverse(2, 5); // [0, 1, 4, 3, 2, 5]
  /// // is the same as:
  /// [0, 1, 2, 3, 4, 5]..reverse(5, 2); // [0, 1, 4, 3, 2, 5]
  /// ```
  ///
  /// Throws [RangeError] when either [start] or [end] are smaller than 0 and
  /// greater than length.
  void reverse([int start = 0, int? end]) {
    end ??= length;

    if (start < 0 || length < start) {
      throw RangeError.range(start, 0, length, 'start');
    }

    if (end < 0 || length < end) {
      throw RangeError.range(end, 0, length, 'end');
    }

    if (start > end) {
      final t = start;
      start = end;
      end = t;
    }

    for (final i in range(start, start + (end - start) ~/ 2)) {
      swap(i, start + end - i - 1);
    }
  }
}
