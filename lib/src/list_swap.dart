extension ListSwap<T> on List<T> {
  /// Swaps the [a]th and [b]th elements of a list.
  ///
  /// Throws [RangeError] if [a] or [b] are not valid indices of the list
  /// (not in range [0, [length] - 1]).
  void swap(int a, int b) {
    final temp = this[a];
    this[a] = this[b];
    this[b] = temp;
  }
}

extension ListMSwap<T> on List<T> {
  /// Swaps the [a] % length and [b] % length elements of a list.
  ///
  /// Before the swap, we take the modulo length of the [a] and [b] numbers.
  ///
  /// For empty lists, this method returns early: it's safe to call and
  /// there won't be a swap.
  void mSwap(int a, int b) {
    final length = this.length;
    if (length == 0) return;
    swap(a % length, b % length);
  }
}