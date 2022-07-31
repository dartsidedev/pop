# `pop`

> `pop.dart`'s a set of utility methods and classes to make Dart development intuitive, simple, and readable.

`pop.dart`'s goal is to provide data structures, algorithms and utilities (in forms of functions, classes and static extension methods) to make your Dart code more expressive, concise and readable without compromising on performance and type safety. 

[![Continuous Integration](https://github.com/dartsidedev/pop/workflows/Continuous%20Integration/badge.svg?branch=main)](https://github.com/dartsidedev/pop/actions) [![codecov](https://codecov.io/gh/dartsidedev/pop/branch/main/graph/badge.svg)](https://codecov.io/gh/dartsidedev/pop) [![pop](https://img.shields.io/pub/v/pop?label=pop&logo=dart)](https://pub.dev/packages/pop 'See pop package info on pub.dev') [![Published by dartside.dev](https://img.shields.io/static/v1?label=Published%20by&message=dartside.dev&logo=dart&logoWidth=30&color=40C4FF&labelColor=1d599b&labelWidth=100)](https://pub.dev/publishers/dartside.dev/packages) [![GitHub Stars Count](https://img.shields.io/github/stars/dartsidedev/pop?logo=github)](https://github.com/dartsidedev/pop 'Star me on GitHub!')

## Disclaimer

This package is still in its early phase of development: APIs might change, behavior might change, and classes and functions may be removed.

## Important links

* [Read the source code and **star the repo** on GitHub](https://github.com/dartsidedev/pop)
* [Open an issue on GitHub](https://github.com/dartsidedev/pop/issues)
* [See package on pub.dev](https://pub.dev/packages/pop)
* [Read the docs on pub.dev](https://pub.dev/documentation/pop/latest/)

**If you enjoy using this package, a thumbs-up on [pub.dev](https://pub.dev/packages/pop) would be highly appreciated! 👍💙 Let's get to 100 likes 🚀**

## Motivation

As I was writing Dart code, I noticed that I keep re-implementing the same patterns over and over again in various projects.
This package tries to implement common data structures and algorithms that make the code more expressive and fast.

Of course, as always, this package is not a silver-bullet, and there are great packages by the Dart team that significantly improve the Dart developer experience and that are actually battle-tested.
Some of these are: [`dart:collection`](https://api.dart.dev/stable/dart-collection/dart-collection-library.html), [`package:collection`](https://pub.dev/packages/collection), [`package:quiver`](https://pub.dev/packages/quiver).
The `pop` package aims to complement these packages, and only "re-invent the wheel" where I am unhappy with the implementation in those libraries.

## Usage

A detailed, beginner-friendly guide with examples is coming soon.

For now, please refer to the [API docs](https://pub.dev/documentation/pop/latest/).
I am doing my best to provide a great documentation with plenty of examples for every function, class and method of this package.

Here are some examples of what this package provides.

### `DefaultMap`

```dart
final string = 'mississippi'.split('');
// Without DefaultMap
final counterMap = <String, int>{};
for (final char in string) {
  if (!counterMap.containsKey(char)) counterMap[char] = 0;
  counterMap[char] = counterMap[char]! + 1;
}
// With DefaultMap
final counterMap = DefaultMap<String, int>(0);
for (final char in string) counterMap[char] += 1;
```

## Contribution

I'd appreciate you reading the docs. I did my best to provide stellar documentation, but sometimes it's just "not there yet".
If you have usage examples, where the package made your code better, feel free to submit a docs improvement PR.
If the description is not clear somewhere and you know how to make it better, open a PR.
If existing behavior is surprising, please open an issue. We will see if we can make the code less surprising.