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
/// for (var char in string) {
///   if (!counterMap.containsKey(char)) counterMap[char] = 0;
///   counterMap[char] = counterMap[char]! + 1;
/// }
///
/// // With DefaultMap
/// final counterMap = DefaultMap<String, int>(0);
/// for (var char in string) counterMap[char]++;
/// ```
///
/// Another example where [DefaultMap] can be useful is when grouping values.
/// Let's say we have a list of strings with duplicated items and we want to
/// create a map with the list items as keys and all their indices in the list
/// as values.
///
/// ```dart
/// final grouped = DefaultMap<String, List<int>>.generate((_) => []);
/// final strings = ['a', 'b', 'c', 'a', 'b', 'b'];
/// for (var e in strings.entries) grouped[e.value].add(e.index);
/// print(grouped) // '{a: [0, 3], b: [1, 4, 5], c: [2]}'
/// ```
///
/// You can control whether a [DefaultMap] writes on a miss using the
/// [writeOnMiss] flag.
///
/// Turning off `writeOnMiss` can be useful when you want to return a fallback
/// value to the caller, but you do not want to store this value in the map,
/// thus affecting [entries], [keys], [length] and other getters and methods.
///
/// Turning ono `writeOnMiss` is useful if you want to modify the default
/// value and you wish to persist these changes.
///
/// The class is inspired by, but not a direct replication of, Python's
/// [`defaultdict`](https://docs.python.org/3/library/collections.html#collections.defaultdict).
class DefaultMap<K, V> extends MapBase<K, V> {
  /// Creates a [DefaultMap] where the values are integers with a fallback
  /// default value of 0 and the keys are of type [K].
  ///
  /// [writeOnMiss] determines whether the map creates entries upon miss.
  /// If omitted, the map does not write on miss.
  static DefaultMap<K, int> ints<K>({
    bool writeOnMiss = false,
  }) =>
      DefaultMap<K, int>(0, writeOnMiss: writeOnMiss);

  /// Creates a [DefaultMap] where the values are doubles with a fallback
  /// default value of 0.0 and the keys are of type [K].
  ///
  /// [writeOnMiss] determines whether the map creates entries upon miss.
  /// If omitted, the map does not write on miss.
  static DefaultMap<K, double> doubles<K>({
    bool writeOnMiss = false,
  }) =>
      DefaultMap<K, double>(0, writeOnMiss: writeOnMiss);

  /// Creates a [DefaultMap] where the values are doubles with a fallback
  /// default value of 0.0 and the keys are of type [K].
  ///
  /// [writeOnMiss] determines whether the map creates entries upon miss.
  /// If omitted, the map does not write on miss.
  static DefaultMap<K, num> nums<K>({
    bool writeOnMiss = false,
  }) =>
      DefaultMap<K, num>(0, writeOnMiss: writeOnMiss);

  /// Creates a [DefaultMap] where the values are strings with a fallback
  /// default value of empty strings `''` the keys are of type [K].
  ///
  /// [writeOnMiss] determines whether the map creates entries upon miss.
  /// If omitted, the map does not write on miss.
  static DefaultMap<K, String> strings<K>({
    bool writeOnMiss = false,
  }) =>
      DefaultMap<K, String>('', writeOnMiss: writeOnMiss);

  /// Creates a [DefaultMap] where the values are strings with a fallback
  /// default value of empty strings `''` the keys are of type [K].
  ///
  /// [writeOnMiss] determines whether the map creates entries upon miss.
  /// If omitted, the map does not write on miss.
  static DefaultMap<K, bool> bools<K>({
    bool writeOnMiss = false,
  }) =>
      DefaultMap<K, bool>(false, writeOnMiss: writeOnMiss);

  /// Creates a [DefaultMap] where the values are lists with a fallback
  /// default value of empty lists of [E] and the keys are of type [K].
  ///
  /// [writeOnMiss] determines whether the map creates entries upon miss.
  /// If omitted, the map writes on miss.
  static DefaultMap<K, List<E>> lists<K, E>({
    bool writeOnMiss = true,
  }) =>
      DefaultMap<K, List<E>>.generate((_) => [], writeOnMiss: writeOnMiss);

  /// Creates a [DefaultMap] where the values are maps with a fallback
  /// default value of empty maps of [DK] and [DV] key-value pairs
  /// and the keys are of type [K].
  ///
  /// [writeOnMiss] determines whether the map creates entries upon miss.
  /// If omitted, the map writes on miss.
  static DefaultMap<K, Map<DK, DV>> maps<K, DK, DV>({
    bool writeOnMiss = true,
  }) =>
      DefaultMap<K, Map<DK, DV>>.generate((_) => {}, writeOnMiss: writeOnMiss);

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
  ///
  /// [writeOnMiss] determines whether the map creates entries upon miss.
  /// By default, the [DefaultMap] will not write into
  /// its internal map when a non-existing value is accessed.
  DefaultMap(
    V defaultValue, {
    bool writeOnMiss = false,
  })  : _inner = {},
        _writeOnMiss = writeOnMiss,
        _getDefault = ((K key) => defaultValue);

  /// Creates a [DefaultMap] with [defaultValue] as fallback, and [innerMap] as the
  /// map that will serve as the container map for the values.
  ///
  /// It uses a newly created empty map as an internal map if [innerMap] is
  /// omitted.
  ///
  /// See [DefaultMap.generate] constructors
  /// if you need more control over how the default value is
  /// constructed.
  ///
  /// If you don't need to customize [innerMap], it is recommended that you use
  /// the shorter [DefaultMap] constructor.
  DefaultMap.filled(
    V defaultValue, {
    Map<K, V>? innerMap,
    bool writeOnMiss = false,
  })  : _writeOnMiss = writeOnMiss,
        _inner = innerMap ?? {},
        _getDefault = ((K key) => defaultValue);

  /// Creates a [DefaultMap] where the fallback value is generated by the
  /// [generator] function.
  ///
  /// It uses a newly created empty map as an internal map if [innerMap] is
  /// omitted.
  ///
  /// If you don't need to know the key to determine the return value,
  /// or if you can share the same default value, consider using
  /// [DefaultMap.filled] or the [DefaultMap] constructor.
  DefaultMap.generate(
    V Function(K key) generator, {
    Map<K, V>? innerMap,
    bool writeOnMiss = false,
  })  : _writeOnMiss = writeOnMiss,
        _inner = innerMap ?? {},
        _getDefault = generator;

  final Map<K, V> _inner;
  final _GetDefault<K, V> _getDefault;

  // Determines whether upon accessing a missing value, the map creates the
  final bool _writeOnMiss;

  @override

  /// Gets value for [key].
  ///
  /// If the [key] is not in the map, the fallback value will be built and
  /// returned.
  ///
  /// Depending on the `writeOnMiss` value passed to the constructor,
  /// we write upon accessing a missing value.
  V operator [](covariant K key) {
    if (_inner.containsKey(key)) return _inner[key]!;
    final v = _getDefault(key);
    if (_writeOnMiss) _inner[key] = v;
    return v;
  }

  @override
  void operator []=(K key, V value) => _inner[key] = value;

  @override
  void clear() => _inner.clear();

  @override
  Iterable<MapEntry<K, V>> get entries => _inner.entries;

  @override
  Iterable<K> get keys => _inner.keys;

  @override
  Iterable<V> get values => _inner.values;

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
