import 'package:test/test.dart';
import 'package:pop/pop.dart';

void main() {
  group('splitReverse', () {
    test('reverses left and right split', () {
      expect(
        [0, 1, 2, 3, 4, 5, 6]..splitReverse(4),
        [3, 2, 1, 0, 6, 5, 4],
      );
    });

    test('reverses whole list if n = 0', () {
      expect(
        [0, 1, 2, 3, 4, 5, 6]..splitReverse(0),
        [6, 5, 4, 3, 2, 1, 0],
      );
    });

    test('reverses whole list if n = length', () {
      expect(
        [0, 1, 2, 3, 4, 5, 6]..splitReverse(7),
        [6, 5, 4, 3, 2, 1, 0],
      );
    });

    test('throws RangeError if n out of bounds (greater)', () {
      expect(
        () => [0, 1, 2, 3, 4, 5, 6]..splitReverse(7),
        isNot(throwsRangeError),
      );

      expect(
        () => [0, 1, 2, 3, 4, 5, 6]..splitReverse(8),
        throwsRangeError,
      );
    });

    test('throws RangeError if n out of bounds (lesser)', () {
      expect(
        () => [0, 1, 2, 3, 4, 5, 6]..splitReverse(0),
        isNot(throwsRangeError),
      );

      expect(
        () => [0, 1, 2, 3, 4, 5, 6]..splitReverse(-1),
        throwsRangeError,
      );
    });
  });
}
