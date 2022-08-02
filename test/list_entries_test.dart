import 'package:pop/pop.dart';
import 'package:test/test.dart';

void main() {
  group('entries', () {
    test('returns empty iterable for empty list', () {
      expect([].entries, isEmpty);
    });

    test('returns len=1 iterable for len=1 list', () {
      expect([1].entries.length, 1);
    });

    test('returns $ListEntry for list with one element in it', () {
      final entry = [1].entries.first;
      expect(entry.index, 0);
      expect(entry.value, 1);
    });


    test('returns len=2 iterable for len=2 list', () {
      expect([1, 2].entries.length, 2);
    });

    test('returns $ListEntry for list with one element in it', () {
      final entries = [1, 2].entries.toList(growable: false);
      expect(entries[0].index, 0);
      expect(entries[0].value, 1);
      expect(entries[1].index, 1);
      expect(entries[1].value, 2);
    });
  });
}