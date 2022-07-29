import 'list_add_first.dart';

extension ListAddLast<E> on List<E> {
  /// Adds [value] to the end of this list,
  /// extending the length by one.
  ///
  /// This function is the same as [add], it was
  /// introduced to be more explicit, and for symmetry
  /// with [addFirst].
  void addLast(E value) => add(value);
}
