import 'package:test/test.dart';
import 'package:pop/pop.dart';

void main() {
  group('addFirst', () {
    test('adds to empty list', () {
      final list = <int>[];
      list.addFirst(2);
      expect(list, [2]);
    });

    test('adds to short list', () {
      final list = <int>[1, 2, 3];
      list.addFirst(0);
      expect(list, [0, 1, 2, 3]);
    });

    test('adds to long list', () {
      final list = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9];
      list.addFirst(0);
      expect(list, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
    });

    test('throws when list is fixed length', () {
      final list = List.filled(1, 0, growable: false);
      expect(() => list.addFirst(0), throwsUnsupportedError);
    });
  });
}
