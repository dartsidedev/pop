import 'package:pop/pop.dart';

void main() {
  // reverse
  final reverseList = [4, 3, 2, 1];
  reverseList.reverse();
  print(reverseList); // [1, 2, 3, 4]

  // reverse with range
  final reverseWithRangeList = [0, 1, 5, 4, 3, 2, 6, 7];
  reverseWithRangeList.reverse(2, 6);
  print(reverseWithRangeList); // [0, 1, 2, 3, 4, 5, 6, 7]

  // splitReverse
  final splitReverseList = [-2, -1, /* split here */ 4, 3, 2, 1];
  splitReverseList.splitReverse(2);
  print(splitReverseList); // [-1, -2, 1, 2, 3, 4]

  // rotate
  final rotateList = [1, 2, 3, 4];
  rotateList.rotate(1);
  print(rotateList); // [4, 1, 2, 3]

  // rotate
  final anotherList = [1, 2, 3, 4];
  print(anotherList.rotated(1).take(3).toList()); // [4, 1, 2]
  print(anotherList); // [1, 2, 3, 4];

  // range
  for (final v in range(1, 3)) {
    print('The number is $v');
    // The number is 1
    // The number is 2
  }

  // swap
  final swappedList = [0, 1, 2, 3];
  swappedList.swap(1, 3);
  print(swappedList); // [0, 3, 2, 1]

  // mSwap
  final mSwappedList = [0, 1, 2, 3];
  mSwappedList.mSwap(0, -1);
  print(mSwappedList); // [3, 1, 2, 0]

  // times
  final timesList = ['a', 'b', 'c'];
  2.times(timesList.removeLast);
  print(timesList); // ['a']

  // timesIndexed
  var counter = 0;
  4.timesIndexed((i) => counter += i); // 0 + 1 + 2 + 3
  print(counter); // 6

  // removeFirst and addFirst
  final firstList = [0, 1, 2];
  final removedFirstValue = firstList.removeFirst();
  print(removedFirstValue); // 0
  print(firstList); // [1, 2]
  firstList.addFirst(removedFirstValue);
  print(firstList); // [0, 1, 2]

  final string = 'mississippi'.split('');
  // Without DefaultMap
  final counterMap1 = <String, int>{};
  for (final char in string) {
    if (!counterMap1.containsKey(char)) counterMap1[char] = 0;
    counterMap1[char] = counterMap1[char]! + 1;
  }
  // With DefaultMap
  final counterMap2 = DefaultMap<String, int>(0);
  for (final char in string) counterMap2[char] += 1;
  // Both give {m: 1, i: 4, s: 4, p: 2}
  print(counterMap1);
  print(counterMap2);
}
