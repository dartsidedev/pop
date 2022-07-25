import 'package:test/test.dart';
import 'package:pop/pop.dart';

void main() {
  group('reverse', () {
    test('reverses the list (length odd)', () {
      expect([1, 2, 3, 4, 5]..reverse(), [5, 4, 3, 2, 1]);
    });

    test('reverses the list (length even)', () {
      expect([1, 2, 3, 4, 5, 6]..reverse(), [6, 5, 4, 3, 2, 1]);
    });

    test('is safe to call with empty list', () {
      expect(<int>[]..reverse(), <int>[]);
    });

    test('reverses the front of the list (range length odd)', () {
      expect(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]..reverse(0, 4),
        [3, 2, 1, 0, 4, 5, 6, 7, 8, 9],
      );
    });

    test('reverses the front of the list (range length even)', () {
      expect(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]..reverse(0, 5),
        [4, 3, 2, 1, 0, 5, 6, 7, 8, 9],
      );
    });

    test('reverses the middle of the list (range length odd)', () {
      expect(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]..reverse(3, 8),
        [0, 1, 2, 7, 6, 5, 4, 3, 8, 9],
      );
    });

    test('reverses until the end of the list if only start is set', () {
      expect([0, 1, 2, 3, 4]..reverse(2), [0, 1, 4, 3, 2]);
    });

    test('end is not included', () {
      expect([0, 1, 2, 3]..reverse(1, 3), [0, 2, 1, 3]);
    });

    test('reverses the middle of the list with out of order start and end', () {
      expect(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]..reverse(8, 3),
        [0, 1, 2, 7, 6, 5, 4, 3, 8, 9],
      );

      expect(
        [0, 1, 2, 3, 4, 5]..reverse(2, 5),
        [0, 1, 4, 3, 2, 5],
      );

      expect(
        [0, 1, 2, 3, 4, 5]..reverse(5, 2),
        [0, 1, 4, 3, 2, 5],
      );
    });

    test('reverses the middle of the list (range length even)', () {
      expect(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]..reverse(3, 7),
        [0, 1, 2, 6, 5, 4, 3, 7, 8, 9],
      );
    });

    test('reverses the end of the list (range length odd)', () {
      expect(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]..reverse(6, 10),
        [0, 1, 2, 3, 4, 5, 9, 8, 7, 6],
      );
    });

    test('reverses the end of the list (range length even)', () {
      expect(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]..reverse(7, 10),
        [0, 1, 2, 3, 4, 5, 6, 9, 8, 7],
      );
    });

    test('does not change the list if range length is 1 (front)', () {
      expect(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]..reverse(0, 1),
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      );
    });

    test('does not change the list if range length is 1 (middle)', () {
      expect(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]..reverse(5, 6),
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      );
    });

    test('does not change the list if range length is 1 (end)', () {
      expect(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]..reverse(8, 9),
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      );
    });

    test('reverses until the end of the list if only start is set', () {
      expect(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]..reverse(5),
        [0, 1, 2, 3, 4, 9, 8, 7, 6, 5],
      );

      expect(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]..reverse(0),
        [9, 8, 7, 6, 5, 4, 3, 2, 1, 0],
      );
    });

    test('throws if start is out of range (greater than length)', () {
      expect(() => [1, 2]..reverse(2, 1), isNot(throwsRangeError));
      expect(() => [1, 2]..reverse(3, 1), throwsRangeError);
    });

    test('throws if start is out of range (lesser than 0)', () {
      expect(() => [1, 2]..reverse(0, 1), isNot(throwsRangeError));
      expect(() => [1, 2]..reverse(-1, 1), throwsRangeError);
    });

    test('throws if end is out of range (greater than length)', () {
      expect(() => [1, 2]..reverse(0, 2), isNot(throwsRangeError));
      expect(() => [1, 2]..reverse(0, 3), throwsRangeError);
    });

    test('throws if end is out of range (lesser than 0)', () {
      expect(() => [1, 2]..reverse(0, 0), isNot(throwsRangeError));
      expect(() => [1, 2]..reverse(0, -1), throwsRangeError);
    });
  });
}
