import 'package:pop/pop.dart';
import 'package:test/test.dart';

void main() {
  group('rotate', () {
    test('does not change list if n == 0', () {
      expect([1, 2, 3, 4]..rotate(0), [1, 2, 3, 4]);
    });

    test('does not change list if n % length == 0', () {
      expect([1, 2, 3, 4]..rotate(4), [1, 2, 3, 4]);
    });

    test('shifts elements by 1 to the right for n == 1', () {
      expect([1, 2, 3, 4]..rotate(1), [4, 1, 2, 3]);
    });

    test('shifts elements by 1 to the left for n == -1 ', () {
      expect([1, 2, 3, 4]..rotate(-1), [2, 3, 4, 1]);
    });

    test('shifts elements by 2', () {
      expect([1, 2, 3, 4, 5, 6]..rotate(2), [5, 6, 1, 2, 3, 4]);
    });

    test('n right shifts are equivalent to (len - n) left shifts', () {
      final list1 = [0, 1, 2, 3, 4, 5, 6];
      final list2 = [...list1];
      final length = list1.length;
      expect(
        list1..rotate(2),
        list2..rotate(-(length - 2)),
      );
    });
  });
}
