import 'package:pop/pop.dart';
import 'package:test/test.dart';

void main() {
  group('range', () {
    test('returns empty if first param is 0', () {
      expect(range(0), isEmpty);
      expect(range(0), isA<Iterable<int>>());

      expect(range(0.0), isEmpty);
      expect(range(0.0), isA<Iterable<double>>());

      expect(range(0), isA<Iterable<num>>());
    });

    test('returns empty if start and end are equal', () {
      expect(range(3, 3), isEmpty);
      expect(range(3, 3), isA<Iterable<int>>());

      expect(range(4.0, 4), isEmpty);
      expect(range(4.0, 4), isA<Iterable<num>>());

      expect(range(5.0, 5), isEmpty);
      expect(range<double>(5.0, 5), isA<Iterable<double>>());

      expect(range(6, 6.0), isEmpty);
      expect(range<num>(6, 6.0), isA<Iterable<num>>());
    });

    test('returns iterable from 0 to end if only first param added', () {
      expect(range(3), [0, 1, 2]);
      expect(range(3), isA<Iterable<int>>());

      expect(range(3.0), [0, 1, 2]);
      expect(range(3.0), isA<Iterable<double>>());
    });

    test('returns iterable from 0 to end if a negative first param added', () {
      expect(range(-3), [0, -1, -2]);
      expect(range(-3), isA<Iterable<int>>());

      expect(range(-3.0), [0, -1, -2]);
      expect(range(-3.0), isA<Iterable<double>>());
    });

    test(
        'returns iterable from start to end with steps of 1 '
        'if last param not added', () {
      expect(range(4, 9), [4, 5, 6, 7, 8]);
      expect(range(4, 9), isA<Iterable<int>>());

      expect(range(4.0, 9.0), [4, 5, 6, 7, 8]);
      expect(range(4.0, 9.0), isA<Iterable<double>>());
    });

    test(
      'returns iterable from start to end with steps of -1 '
      'if last param not added '
      'and start is greater than end',
      () {
        expect(range(9, 5), [9, 8, 7, 6]);
        expect(range(9, 5), isA<Iterable<int>>());

        expect(range(9.0, 5.0), [9, 8, 7, 6]);
        expect(range(9.0, 5.0), isA<Iterable<double>>());
      },
    );

    test(
      'returns iterable from start to end with steps of 1 '
      'for non-whole doubles',
      () {
        expect(range(2.3, 5.3), [2.3, 3.3, 4.3]);
      },
    );

    test(
      'returns iterable start to end with steps of -1 '
      'for non-whole doubles if start is greater than end',
      () {
        expect(range(-2.5, -7.5), [-2.5, -3.5, -4.5, -5.5, -6.5]);
      },
    );

    test('returns iterable with steps sequence', () {
      expect(range(2, 7, 2), [2, 4, 6]);
      expect(range(2, 8, 2), [2, 4, 6]);

      expect(range(2, 8, 3), [2, 5]);
      expect(range(2, 9, 3), [2, 5, 8]);

      expect(range(5, -5, -2), [5, 3, 1, -1, -3]);
      expect(range(5, -6, -2), [5, 3, 1, -1, -3, -5]);
    });

    test(
      'returns empty iterable if steps are in incorrect direction',
      () {
        expect(range(2, 7, -1), isEmpty);
        expect(range(2, -5, 2), isEmpty);
      },
    );
  });
}
