import 'package:pop/pop.dart';

void reverseList() {
  final list = [4, 3, 2, 1];
  list.reverse();

  expectPrint(label: 'reverse list', list, '[1, 2, 3, 4]');
}

void reverseListWithRange() {
  final list = [0, 1, 5, 4, 3, 2, 6, 7];
  list.reverse(2, 6);

  expectPrint(label: 'reverse with range', list, '[0, 1, 2, 3, 4, 5, 6, 7]');
}

void splitReverse() {
  final list = [-2, -1, /* split here */ 4, 3, 2, 1];
  list.splitReverse(2);

  expectPrint(label: 'split reverse', list, '[-1, -2, 1, 2, 3, 4]');
}

void rotate() {
  final list = [1, 2, 3, 4];
  list.rotate(1);

  expectPrint(label: 'rotate', list, '[4, 1, 2, 3]');
}

void rotated() {
  final list = [1, 2, 3, 4];

  expectPrint(label: 'rotated', list.rotated(1).take(3).toList(), '[4, 1, 2]');
  expectPrint(label: 'rotated original list', list, '[1, 2, 3, 4]');
}

void swap() {
  final list = [0, 1, 2, 3];
  list.swap(1, 3);

  expectPrint(label: 'swap', list, '[0, 3, 2, 1]');
}

void mSwap() {
  final list = [0, 1, 2, 3];
  list.mSwap(0, -1);

  expectPrint(label: 'mSwap', list, '[3, 1, 2, 0]');
}

void times() {
  final list = ['a', 'b', 'c'];
  2.times(list.removeLast);

  expectPrint(label: 'times', list, '[a]');
}

void timesIndexed() {
  var counter = 0;
  4.timesIndexed((i) => counter += i); // 0 + 1 + 2 + 3

  expectPrint(label: 'indexed times', counter, '6');
}

void removeFirstAddFirst() {
  final list = [0, 1, 2];
  final removed = list.removeFirst();

  expectPrint(label: 'removed', removed, '0');
  expectPrint(label: 'removed, original list', list, '[1, 2]');

  list.addFirst(removed);

  expectPrint(label: 'added', list, '[0, 1, 2]');
}

void countLettersWithoutDefaultMap() {
  final counter = <String, int>{};
  for (final char in 'mississippi'.split('')) {
    if (!counter.containsKey(char)) counter[char] = 0;
    counter[char] = counter[char]! + 1;
  }

  expectPrint(
    label: 'counter without default map',
    counter,
    '{m: 1, i: 4, s: 4, p: 2}',
  );
}

void countLettersWithDefaultMap() {
  final counter = DefaultMap<String, int>(0);
  for (final char in 'mississippi'.split('')) counter[char]++;

  expectPrint(
    label: 'counter with default map',
    counter,
    '{m: 1, i: 4, s: 4, p: 2}',
  );
}

void groupItemsWithoutDefaultMap() {
  final grouped = <String, List<int>>{};
  for (var e in ['a', 'b', 'c', 'a'].entries) {
    if (!grouped.containsKey(e.value)) {
      grouped[e.value] = [];
    }
    grouped[e.value]!.add(e.index);
  }

  expectPrint(
    label: 'group without default map',
    grouped,
    '{a: [0, 3], b: [1], c: [2]}',
  );
}

void groupItemsWithDefaultMap() {
  final grouped = DefaultMap<String, List<int>>.generate((_) => []);
  for (var e in ['a', 'b', 'c', 'a'].entries) grouped[e.value].add(e.index);

  expectPrint(
    label: 'group with default map',
    grouped,
    '{a: [0, 3], b: [1], c: [2]}',
  );
}

void main() {
  reverseList();
  reverseListWithRange();
  splitReverse();
  rotate();
  rotated();
  swap();
  mSwap();
  times();
  timesIndexed();
  removeFirstAddFirst();
  countLettersWithoutDefaultMap();
  countLettersWithDefaultMap();
  groupItemsWithoutDefaultMap();
  groupItemsWithDefaultMap();
}

void expectPrint(Object? object, String expected, {String? label}) {
  final actual = '$object';
  print(label == null ? actual : '$label: $actual');
  if (actual != expected) {
    throw AssertionError('Expected "$expected", but got "$actual"');
  }
}
