import 'package:pop/pop.dart';
import 'package:test/test.dart';

void main() {
  group(DefaultMap, () {
    DefaultMap<int, int> m;

    test('retrieves default value if key is not present', () {
      m = DefaultMap<int, int>(11);
      expect(m[1], 11);

      m = DefaultMap<int, int>(12, writeOnMiss: false);
      expect(m[1], 12);

      m = DefaultMap<int, int>(13, writeOnMiss: true);
      expect(m[1], 13);

      m = DefaultMap<int, int>.filled(14);
      expect(m[1], 14);

      m = DefaultMap<int, int>.filled(15, writeOnMiss: false);
      expect(m[1], 15);

      m = DefaultMap<int, int>.filled(16, writeOnMiss: true);
      expect(m[1], 16);

      m = DefaultMap<int, int>.generate((k) => 2 * k);
      expect(m[1], 2);

      m = DefaultMap<int, int>.generate((k) => 3 * k, writeOnMiss: false);
      expect(m[1], 3);

      m = DefaultMap<int, int>.generate((k) => 4 * k, writeOnMiss: true);
      expect(m[1], 4);
    });

    test('adds value to internal map on miss if writeOnMiss is true', () {
      m = DefaultMap<int, int>(13, writeOnMiss: true);
      expect(m[1], 13);
      expect(m.containsKey(1), true);
      expect(m, hasLength(1));

      m = DefaultMap<int, int>.filled(16, writeOnMiss: true);
      expect(m[1], 16);
      expect(m.containsKey(1), true);
      expect(m, hasLength(1));

      m = DefaultMap<int, int>.generate((k) => 4 * k, writeOnMiss: true);
      expect(m[1], 4);
      expect(m.containsKey(1), true);
      expect(m, hasLength(1));
    });

    test('does not add value to internal map on miss if writeOnMiss is false',
        () {
      m = DefaultMap<int, int>(13, writeOnMiss: false);
      expect(m[1], 13);
      expect(m.containsKey(1), false);
      expect(m, hasLength(0));

      m = DefaultMap<int, int>.filled(16, writeOnMiss: false);
      expect(m[1], 16);
      expect(m.containsKey(1), false);
      expect(m, hasLength(0));

      m = DefaultMap<int, int>.generate((k) => 4 * k, writeOnMiss: false);
      expect(m[1], 4);
      expect(m.containsKey(1), false);
      expect(m, hasLength(0));
    });

    test('retrieves real value if key is present', () {
      m = DefaultMap<int, int>(13, writeOnMiss: false);
      m[3] = 5;
      expect(m[3], 5);
      expect(m.containsKey(3), true);
      expect(m, hasLength(1));

      m = DefaultMap<int, int>.filled(16, writeOnMiss: false);
      m[4] = 8;
      expect(m[4], 8);
      expect(m.containsKey(4), true);
      expect(m, hasLength(1));

      m = DefaultMap<int, int>.generate((k) => 4 * k, writeOnMiss: false);
      m[5] = 1;
      expect(m[5], 1);
      expect(m.containsKey(5), true);
      expect(m, hasLength(1));
    });

    test('can be cleared (all items removed)', () {
      final m = DefaultMap<int, int>(11);
      m[2] = 4;
      m[3] = 2;
      expect(m[2], 4);
      expect(m[3], 2);
      expect(m.containsKey(2), true);
      expect(m.containsKey(3), true);
      expect(m, hasLength(2));
      m.clear();
      expect(m.containsKey(2), false);
      expect(m.containsKey(3), false);
      expect(m, hasLength(0));
    });

    test('individual entries can be removed', () {
      final m = DefaultMap<int, int>(11);
      m[2] = 4;
      m[3] = 2;

      expect(m.containsKey(2), true);
      expect(m.containsKey(3), true);
      expect(m, hasLength(2));

      expect(m.remove(3), 2);

      expect(m[2], 4);
      expect(m[3], 11);
      expect(m.containsKey(2), true);
      expect(m.containsKey(3), false);
      expect(m, hasLength(1));
    });

    test('passed-in internal map', () {
      final im = <int, int>{1: 2, 3: 4};
      m = DefaultMap<int, int>.filled(11, innerMap: im);
      m[2] = 4;

      expect(m[1], 2);
      expect(m[2], 4);
      expect(m[3], 4);
      expect(m.length, 3);

      expect(im[2], 4);

      m.clear();

      expect(m.length, 0);
      expect(im.length, 0);
    });

    test('ints', () {
      final m = DefaultMap.ints<int>();
      m[2] = 9;
      expect(m[1], 0);
      expect(m[2], 9);
      expect(m, hasLength(1));
    });

    test('doubles', () {
      final m = DefaultMap.doubles<int>();
      m[2] = 9;
      expect(m[1], 0);
      expect(m[2], 9);
      expect(m, hasLength(1));
    });

    test('bools', () {
      final m = DefaultMap.bools<int>();
      m[2] = true;
      expect(m[1], false);
      expect(m[2], true);
      expect(m, hasLength(1));
    });

    test('nums', () {
      final m = DefaultMap.nums<int>();
      m[2] = 1.4;
      m[6] = 1;
      expect(m[1], 0);
      expect(m[2], 1.4);
      expect(m[6], 1);
      expect(m, hasLength(2));
    });

    test('lists', () {
      final m = DefaultMap.lists<int, int>();
      m[2] = [1, 2, 3];
      expect(m[1], isEmpty);
      expect(m[2], hasLength(3));
    });

    test('maps', () {
      final m = DefaultMap.maps<int, int, int>();
      m[2] = {3: 4};
      expect(m[1], isEmpty);
      expect(m[2], {3: 4});
    });
  });
}
