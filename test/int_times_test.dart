import 'package:pop/pop.dart';
import 'package:test/test.dart';

void main() {
  group('times', () {
    test('calls fn n times for positive numbers', () {
      var counter = 0;
      5.times(() => counter++);
      expect(counter, 5);
    });

    test('does not call fn for zero', () {
      var counter = 0;
      0.times(() => counter++);
      expect(counter, 0);
    });

    test('does not call fn for negative numbers', () {
      var counter = 0;
      (-4).times(() => counter++);
      expect(counter, 0);
    });
  });
}
