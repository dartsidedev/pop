Iterable<N> range<N extends num>(
  N startOrEnd, [
  N? end,
  N? step,
]) sync* {
  final isInt = startOrEnd is int;

  // with all due respect, wtf Dart.
  // I guess I understand why quiver's range is supporting only nums.
  final zero = (isInt ? 0 : 0.0) as N;
  final one = (isInt ? 1 : 1.0) as N;
  final minusOne = (isInt ? -1 : -1.0) as N;

  final $start = end == null ? zero : startOrEnd;
  final $end = end ?? startOrEnd;
  final $step = step ?? (($start < $end) ? one : minusOne);

  bool isInRange(N value) {
    if ($step.isNegative) return $end < value && value <= $start;
    return $start <= value && value < $end;
  }

  if ($start == $end) return;

  var value = $start;
  while (isInRange(value)) {
    yield value;
    value = (value + $step) as N;
  }
}

// Idea: rangeIndexed?
