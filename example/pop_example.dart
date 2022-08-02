import 'package:pop/pop.dart';

void main() {
  // reverse
  final reverseList = [4, 3, 2, 1];
  reverseList.reverse();
  expectPrint(reverseList, '[1, 2, 3, 4]');

  // reverse with range
  final reverseWithRangeList = [0, 1, 5, 4, 3, 2, 6, 7];
  reverseWithRangeList.reverse(2, 6);
  expectPrint(reverseWithRangeList, '[0, 1, 2, 3, 4, 5, 6, 7]');

  // splitReverse
  final splitReverseList = [-2, -1, /* split here */ 4, 3, 2, 1];
  splitReverseList.splitReverse(2);
  expectPrint(splitReverseList, '[-1, -2, 1, 2, 3, 4]');

  // rotate
  final rotateList = [1, 2, 3, 4];
  rotateList.rotate(1);
  expectPrint(rotateList, '[4, 1, 2, 3]');

  // rotate
  final anotherList = [1, 2, 3, 4];
  expectPrint(anotherList.rotated(1).take(3).toList(), '[4, 1, 2]');
  expectPrint(anotherList, '[1, 2, 3, 4]'); //

  // range
  for (final v in range(1, 3)) {
    print('The number is $v');
    // The number is 1
    // The number is 2
  }

  // swap
  final swappedList = [0, 1, 2, 3];
  swappedList.swap(1, 3);
  expectPrint(swappedList, '[0, 3, 2, 1]');

  // mSwap
  final mSwappedList = [0, 1, 2, 3];
  mSwappedList.mSwap(0, -1);
  expectPrint(mSwappedList, '[3, 1, 2, 0]');

  // times
  final timesList = ['a', 'b', 'c'];
  2.times(timesList.removeLast);
  expectPrint(timesList, '[a]');

  // timesIndexed
  var counter = 0;
  4.timesIndexed((i) => counter += i); // 0 + 1 + 2 + 3
  expectPrint(counter, '6');

  // removeFirst and addFirst
  final firstList = [0, 1, 2];
  final removedFirstValue = firstList.removeFirst();
  expectPrint(removedFirstValue, '0');
  expectPrint(firstList, '[1, 2]');
  firstList.addFirst(removedFirstValue);
  expectPrint(firstList, '[0, 1, 2]');

  // Counting letters with and without DefaultMap
  final string = 'mississippi'.split('');
  // Without DefaultMap
  final counterMap1 = <String, int>{};
  for (final char in string) {
    if (!counterMap1.containsKey(char)) counterMap1[char] = 0;
    counterMap1[char] = counterMap1[char]! + 1;
  }
  // With DefaultMap
  final counterMap2 = DefaultMap<String, int>(0);
  for (final char in string) counterMap2[char]++;
  expectPrint(counterMap1, '{m: 1, i: 4, s: 4, p: 2}');
  expectPrint(counterMap2, '{m: 1, i: 4, s: 4, p: 2}');

  // Grouping items with DefaultMap
  final grouped = DefaultMap<String, List<int>>.generate((_) => []);
  final strings = ['a', 'b', 'c', 'a', 'b', 'b'];
  for (var e in strings.entries) grouped[e.value].add(e.index);
  expectPrint(grouped, '{a: [0, 3], b: [1, 4, 5], c: [2]}');
}

void expectPrint(Object? object, String expected) {
  final actual = '$object';
  print(actual);
  if (actual != expected) {
    throw AssertionError('Expected "$expected", but got $actual');
  }
}
