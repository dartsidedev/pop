extension ListEntries<E> on List<E> {
  /// The list entries of [this] list.
  Iterable<ListEntry<E>> get entries sync* {
    for (var i = 0; i < length; i++) yield ListEntry(i, this[i]);
  }
}

/// A index/value pair representing an entry in a [List].
class ListEntry<E> {
  const ListEntry(this.index, this.value);

  /// The index of the entry.
  final int index;

  /// The value at [index] in the list.
  final E value;

  @override
  String toString() => '$ListEntry($index, $value)';
}
