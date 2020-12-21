# AssertThat

This library tries to make AssertJ-style readable assertions usable in Swift.

It is currently experimental and *super work in progress*.

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
