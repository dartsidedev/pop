import 'package:pop/pop.dart';
import 'package:test/test.dart';

void main() {
  group('timesIndexed', () {
    test('calls fn n times for positive numbers', () {
      var counter = 0;
      4.timesIndexed((i) => counter += i);
      expect(counter, 6);
    });

    test('does not call fn for zero', () {
      var counter = 0;
      0.timesIndexed((i) => counter += i);
      expect(counter, 0);
    });

    test('does not call fn for negative numbers', () {
      var counter = 0;
      (-4).timesIndexed((i) => counter += i);
      expect(counter, 0);
    });
  });
}