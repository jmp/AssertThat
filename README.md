# AssertThat
![Lint status](https://github.com/jmp/assert-that/workflows/lint/badge.svg)
![Tests status](https://github.com/jmp/assert-that/workflows/tests/badge.svg)

This library tries to make AssertJ-style readable assertions usable in Swift.

It is currently experimental and **super work in progress**.

## Motivation

The idea is that instead of having to write things like `XCTAssertEqual(someVar, "foo")` we can write
something like this instead:

```swift
assertThat(someVar).isEqualTo("foo")
```

This also allows more complicated assertion chains, for example:

```swift
assertThat("The quick brown fox")
    .startsWith("The")
    .contains("brown")
    .endsWith("fox")
```

It should also allow the use of extensions to support custom assertions.

## How does it work

It makes use of Swift generics and extensions. The generic function `assertThat` returns an
`Assertion` struct holding the subject of the assertion. Literally everything else is implemented as
a extensions of `Assertion` whose subject is of particular type or conforms to a particular protocol.

For example, `startsWith` is implemented as an extension of `Assertion` whose subject conforms to
`StringProtocol`. If the subject conforms to the `Comparable` protocol, then things like `isLessThan`
and `isBetween` can be used.

To implement assertions for your own types, chances are some of the built-in ones (like those for
`Equatable`) already work. But it's also trivial to write your own by writing extensions for
`Assertion`.

## Example usage

First, import the module:

```swift
import AssertThat
```

Common assertions for optionals:

```swift
assertThat(x).isNil()
assertThat(x).isNotNil()
```

Booleans:

```swift
assertThat(x).isTrue()
assertThat(x).isFalse()
```

Equatables:

```swift
assertThat(x).isEqualTo(y)
assertThat(x).isNotEqualTo(y)
assertThat(x).isIn(someSequence)
assertThat(x).isNotIn(someSequence)
```

Comparables:

```swift
assertThat(x).isGreaterThanOrEqualTo(y)
assertThat(x).isLessThan(y)
assertThat(x).isBetween(y, z)
assertThat(x).isStrictlyBetween(y, z)
```

Strings:

```swift
assertThat(someString).isEmpty()
assertThat(someString).isNotEmpty()

// Chaining is also supported
assertThat(someString)
    .startsWith("foo")
    .contains("bar")
    .endsWith("baz")
    .matches("^foobar.+$")
    .doesNotMatch("^Test$")
```

Errors:

```swift
assertThat { someBlockOfCode }.throws(someSpecificError)
assertThat { someBlockOfCode }.throws(SomeErrorType.self)
assertThat { someBlockOfCode }.doesNotThrow(someError)
assertThat { someBlockOfCode }.throwsAnError() // Throws any error
assertThat { someBlockOfCode }.doesNotThrowAnError() // Doesn't throws any error
```

Browse the code and test cases for more complete examples.
