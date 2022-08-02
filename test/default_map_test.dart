import 'package:pop/pop.dart';
import 'package:test/test.dart';

void main() {
  group(DefaultMap, () {
    group('DefaultMap default constructor', () {
      test('retrieves default value if key is not present', () {
        final dm = DefaultMap<int, int>(11);
        expect(dm[1], 11);
        expect(dm[-1], 11);
        expect(dm[0], 11);
        expect(dm[999], 11);
      });

      test('will add entry for the key that was accessed with default', () {
        final dm = DefaultMap<int, int>(11);
        expect(dm[1], 11);
        expect(dm.containsKey(1), true);
      });

      test('retrieves value if key is present', () {
        final dm = DefaultMap<int, int>(11);
        dm[2] = 4;
        expect(dm[2], 4);
        expect(dm[1], 11);
      });

      test('can be cleared', () {
        final dm = DefaultMap<int, int>(11);
        dm[2] = 4;
        expect(dm[2], 4);
        expect(dm.containsKey(2), true);
        expect(dm.length, 1);
        dm.clear();
        expect(dm.containsKey(2), false);
        expect(dm.length, 0);
      });

      test('removes entry', () {
        final dm = DefaultMap<int, int>(11);
        dm[2] = 4;
        expect(dm[2], 4);
        expect(dm.containsKey(2), true);
        expect(dm.length, 1);
        dm.remove(2);
        expect(dm.containsKey(2), false);
        expect(dm.length, 0);
      });
    });

    group('DefaultMap.filled (inner is null)', () {
      test('retrieves default value if key is not present', () {
        final dm = DefaultMap<int, int>.filled(11);
        expect(dm[1], 11);
        expect(dm[-1], 11);
        expect(dm[0], 11);
        expect(dm[999], 11);
      });

      test('retrieves value if key is present', () {
        final dm = DefaultMap<int, int>.filled(11);
        dm[2] = 4;
        expect(dm[2], 4);
        expect(dm[1], 11);
      });

      test('can be cleared', () {
        final dm = DefaultMap<int, int>.filled(11);
        dm[2] = 4;
        expect(dm[2], 4);
        expect(dm.containsKey(2), true);
        expect(dm.length, 1);
        dm.clear();
        expect(dm.containsKey(2), false);
        expect(dm.length, 0);
      });

      test('removes entry', () {
        final dm = DefaultMap<int, int>.filled(11);
        dm[2] = 4;
        expect(dm[2], 4);
        expect(dm.containsKey(2), true);
        expect(dm.length, 1);
        dm.remove(2);
        expect(dm.containsKey(2), false);
        expect(dm.length, 0);
      });
    });

    group('DefaultMap.filled (inner is set)', () {
      test('retrieves default value if key is not present', () {
        final dm = DefaultMap<int, int>.filled(11, {4: 5});
        expect(dm[1], 11);
      });

      test('retrieves value if key is present', () {
        final dm = DefaultMap<int, int>.filled(11, {4: 5});
        dm[2] = 4;
        expect(dm[2], 4);
        expect(dm[1], 11);
        expect(dm[4], 5);
      });

      test('can be cleared (inner map affected, too)', () {
        final im = <int, int>{1: 2, 3: 4};
        final dm = DefaultMap<int, int>.filled(11, im);
        dm[2] = 4;
        expect(dm[1], 2);
        expect(dm[2], 4);
        expect(dm[3], 4);
        expect(dm.containsKey(1), true);
        expect(dm.containsKey(2), true);
        expect(dm.containsKey(3), true);
        expect(dm.length, 3);
        dm.clear();
        expect(dm.containsKey(1), false);
        expect(dm.containsKey(2), false);
        expect(dm.containsKey(3), false);
        expect(dm.length, 0);
        expect(im.length, 0);
        expect(im.containsKey(1), false);
        expect(im.containsKey(2), false);
        expect(im.containsKey(3), false);
        expect(im[1], null);
        expect(im[2], null);
        expect(im[3], null);
      });

      test('removes entry', () {
        final im = <int, int>{1: 2, 3: 4};
        final dm = DefaultMap<int, int>.filled(11, im);
        dm[2] = 4;
        expect(dm[1], 2);
        expect(dm[2], 4);
        expect(dm[3], 4);
        expect(dm.length, 3);
        final removed1 = dm.remove(1);
        final removed2 = dm.remove(2);
        expect(removed1, 2);
        expect(removed2, 4);
        expect(dm.containsKey(1), false);
        expect(dm.containsKey(2), false);
        expect(dm.containsKey(3), true);
        expect(dm.length, 1);
        expect(im.length, 1);
      });
    });

    group('DefaultMap.generate without inner', () {
      test('generates default value if key is not present', () {
        final dm = DefaultMap<int, int>.generate((key) => 3 * key);
        expect(dm[1], 3);
        expect(dm[-1], -3);
      });

      test('retrieves value if key is present', () {
        final dm = DefaultMap<int, int>.generate((key) => 3 * key);
        dm[2] = 1;
        expect(dm[2], 1);
        expect(dm[1], 3);
      });

      test('can be cleared', () {
        final dm = DefaultMap<int, int>.generate((key) => 3 * key);
        dm[2] = 4;
        expect(dm[2], 4);
        expect(dm.length, 1);
        dm.clear();
        expect(dm.length, 0);
      });

      test('removes entry', () {
        final dm = DefaultMap<int, int>.generate((key) => 3 * key);
        dm[2] = 8;
        expect(dm[2], 8);
        expect(dm.containsKey(2), true);
        expect(dm.length, 1);
        var removed = dm.remove(2);
        expect(removed, 8);
        expect(dm.containsKey(2), false);
        expect(dm.length, 0);
        removed = dm.remove(2);
        expect(removed, 6);
        expect(dm.containsKey(2), false);
        expect(dm.length, 0);
      });
    });
  });
}
