import 'package:pop/pop.dart';
import 'package:test/test.dart';

void main() {
  group('rotated', () {
    test('does not change list if n == 0', () {
      expect([1, 2, 3, 4].rotated(0), [1, 2, 3, 4]);
    });

    test('does not change list if n % length == 0', () {
      expect([1, 2, 3, 4].rotated(4), [1, 2, 3, 4]);
    });

    test('returns new list with elements shifted by 1 to the right for n == 1', () {
      expect([1, 2, 3, 4].rotated(1), [4, 1, 2, 3]);
    });

    test('returns new list with elements shifted by 1 to the left for n == -1 ', () {
      expect([1, 2, 3, 4].rotated(-1), [2, 3, 4, 1]);
    });

    test('returns new list with elements shifted by 2', () {
      expect([1, 2, 3, 4, 5, 6].rotated(2), [5, 6, 1, 2, 3, 4]);
    });

    test('n right shifts are equivalent to (len - n) left shifts', () {
      final list = [0, 1, 2, 3, 4, 5, 6];
      final length = list.length;

      final expectedRotated = [5, 6, 0, 1, 2, 3, 4];
      expect(
        list.rotated(2),
        expectedRotated,
      );
      expect(
        list.rotated(-(length - 2)),
        expectedRotated,
      );
      expect(
        list,
        [0, 1, 2, 3, 4, 5, 6],
        reason: 'The rotated method must not modify the original list',
      );
    });
  });
}
