import 'dart:collection';

/// The [DefaultMap] is a [Map]-like class that calls a factory function
/// to supply missing values while storing values in an internal map.
///
/// The [DefaultMap] is designed to help you out with missing values in a map.
///
/// It overrides the `[]` operator: when a value for a given key is present
/// in the internal map, its value is returned. When the value is not set,
/// the factory function is called to supply the default value: it creates a
/// new entry in the map and returns its value.
///
/// Using [DefaultMap] can be useful, for example, for creating a letter counter
/// (for example the ransom note coding exercise). See how it simplifies code,
/// making your more concise, more explicit, and easier to read.
///
/// ```dart
/// final string = 'mississippi'.split('');
/// // Without DefaultMap
/// final counterMap = <String, int>{};
/// for (final char in string) {
///   if (!counterMap.containsKey(char)) counterMap[char] = 0;
///   counterMap[char] = counterMap[char]! + 1;
/// }
///
/// // With DefaultMap
/// final counterMap = DefaultMap<String, int>(0);
/// for (final char in string) counterMap[char] += 1;
/// ```
///
/// The class is inspired by Python's
/// [`defaultdict`](https://docs.python.org/3/library/collections.html#collections.defaultdict).
class DefaultMap<K, V> extends MapBase<K, V> {
  /// Creates a [DefaultMap] with [defaultValue] as fallback.
  ///
  /// It uses a newly created empty map as an internal map.
  ///
  /// See [DefaultMap.filled] and [DefaultMap.generate] constructors
  /// if you need more control over the internal map or how the default value is
  /// fetched/constructed.
  ///
  /// ```dart
  ///  final letterCounter = DefaultMap<String, int>(0);
  ///  for (var c in 'Hello there'.split('')) letterCounter[c] += 1;
  ///  print(letterCounter); // {H: 1, e: 3, l: 2, o: 1,  : 1, t: 1, h: 1, r: 1}
  /// ```
  DefaultMap(V defaultValue)
      : _inner = {},
        _getDefault = ((K key) => defaultValue);

  /// Creates a [DefaultMap] with [defaultValue] as fallback, and [inner] as the
  /// map that will serve as the container map for the values.
  ///
  /// It uses a newly created empty map as an internal map if [inner] is
  /// omitted.
  ///
  /// See [DefaultMap.generate] constructors
  /// if you need more control over how the default value is
  /// constructed.
  ///
  /// If you don't need to customize [inner], it is recommended that you use
  /// the shorter [DefaultMap] constructor.
  DefaultMap.filled(V defaultValue, [Map<K, V>? inner])
      : _inner = inner ?? {},
        _getDefault = ((K key) => defaultValue);

  /// Creates a [DefaultMap] where the fallback value is generated by the
  /// [generator] function.
  ///
  /// It uses a newly created empty map as an internal map if [inner] is
  /// omitted.
  ///
  /// If you don't need to know the key to determine the return value,
  /// or if you can share the same default value, consider using
  /// [DefaultMap.filled] or the [DefaultMap] constructor.
  DefaultMap.generate(V Function(K key) generator, [Map<K, V>? inner])
      : _inner = inner ?? {},
        _getDefault = generator;

  final Map<K, V> _inner;
  final _GetDefault<K, V> _getDefault;

  @override

  /// Gets value for [key].
  ///
  /// If the [key] is not in the map, the fallback value will be built and
  /// returned.
  V operator [](covariant K key) {
    if (_inner.containsKey(key)) return _inner[key]!;
    final v =  _getDefault(key);
    _inner[key] = v;
    return v;
  }

  @override
  void operator []=(K key, V value) => _inner[key] = value;

  @override
  void clear() => _inner.clear();

  @override
  Iterable<K> get keys => _inner.keys;

  // Consider what should happen here if key is not in map.
  // Should it return the default value, or should it return null?

  /// Removes value for [key].
  ///
  /// If the [key] is not in the map, the returned value will be the
  /// value built by the factory function.
  @override
  V remove(covariant K key) => _inner.remove(key) ?? _getDefault(key);
}

typedef _GetDefault<K, V> = V Function(K key);
