import 'package:test/test.dart';
import 'package:pop/pop.dart';

void main() {
  group('swap', () {
    test('changes two elements of the list a < b', () {
      expect([0, 1, 2, 3]..swap(0, 1), [1, 0, 2, 3]);
    });

    test('changes two elements of the list b < a', () {
      expect([0, 1, 2, 3]..swap(2, 1), [0, 2, 1, 3]);
    });

    test('does not change the list if a == b', () {
      expect([0, 1, 2, 3]..swap(1, 1), [0, 1, 2, 3]);
    });

    test('does not change when applied twice', () {
      expect(
        [0, 1, 2, 3]
          ..swap(2, 1)
          ..swap(2, 1),
        [0, 1, 2, 3],
      );
    });

    test('throws when a < 0', () {
      expect(() => [0, 1, 2, 3].swap(-1, 2), throwsRangeError);
    });

    test('throws when length <= a', () {
      expect(() => [0, 1, 2, 3].swap(4, 2), throwsRangeError);
    });

    test('throws when b < 0', () {
      expect(() => [0, 1, 2, 3]..swap(1, -2), throwsRangeError);
    });

    test('throws when length <= b', () {
      expect(() => [0, 1, 2, 3]..swap(3, 4), throwsRangeError);
    });
  });

  group('mSwap', () {
    test('changes two elements of the list a < b', () {
      expect([0, 1, 2, 3]..mSwap(0, 1), [1, 0, 2, 3]);
    });

    test('changes two elements of the list b < a', () {
      expect([0, 1, 2, 3]..mSwap(2, 1), [0, 2, 1, 3]);
    });

    test('does not change the list if a == b', () {
      expect([0, 1, 2, 3]..mSwap(1, 1), [0, 1, 2, 3]);
    });

    test('does not change when applied twice', () {
      expect(
        [0, 1, 2, 3]
          ..mSwap(2, 1)
          ..mSwap(2, 1),
        [0, 1, 2, 3],
      );
    });

    test('changes first and last element with 0 and -1', () {
      expect([0, 1, 2, 3]..mSwap(0, -1), [3, 1, 2, 0]);
    });

    test('does not change if mod equal', () {
      expect([0, 1, 2, 3]..mSwap(1, 5), [0, 1, 2, 3]);
    });

    test('does not throw for empty list', () {
      expect(<int>[]..mSwap(6, 9), <int>[]);
    });
  });
}
