import 'package:pop/pop.dart';
import 'package:test/test.dart';

void main() {
  group('removeFirst', () {
    test('removes first element of a growable, non-empty list', () {
      final list = [1, 2, 3];
      expect(list.removeFirst(), 1);
      expect(list, [2, 3]);
    });

    test('throws for non-growable lists', () {
      final nonGrowable = List.filled(3, 1, growable: false);
      expect(
        () => nonGrowable.removeFirst(),
        throwsUnsupportedError,
      );
    });

    test('throws for empty lists', () {
      final empty = <String>[];
      expect(
        () => empty.removeFirst(),
        throwsRangeError,
      );
    });
  });
}
