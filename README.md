# AssertThat

This library tries to make AssertJ-style readable assertions usable in Swift.

It is currently experimental and *super work in progress*.

## Motivation

The idea is that instead of having to write things like `XCTAssertEqual(someVar, "foo")` we can write
something like this instead:

    assertThat(someVar).isEqualTo("foo")

This also allows more complicated assertion chains, for example:

    assertThat("The quick brown fox")
        .startsWith("The")
        .contains("brown")
        .endsWith("fox")

It should also allow the use of extensions to support custom assertions.

## Example usage

First, import the module:

    import AssertThat

Common assertions for optionals:

    assertThat(x).isNil()
    assertThat(x).isNotNil()

Booleans:

    assertThat(x).isTrue()
    assertThat(x).isFalse()

Equatables:

    assertThat(x).isEqualTo(y)
    assertThat(x).isNotEqualTo(y)
    assertThat(x).isIn(someSequence)
    assertThat(x).isNotIn(someSequence)

Comparables:

    assertThat(x).isGreaterThanOrEqualTo(y)
    assertThat(x).isLessThan(y)
    assertThat(x).isBetween(y, z)
    assertThat(x).isStrictlyBetween(y, z)

Strings:

    assertThat(someString).isEmpty()
    assertThat(someString).isNotEmpty()
    
    // Chaining is also supported
    assertThat(someString)
        .startsWith("foo")
        .contains("bar")
        .endsWith("baz")
        .matches("^foobar.+$")
        .doesNotMatch("^Test$")

Errors:

    assertThat { someBlockOfCode }.throws(someSpecificError)
    assertThat { someBlockOfCode }.throws(SomeErrorType.self)
    assertThat { someBlockOfCode }.doesNotThrow(someError)
    assertThat { someBlockOfCode }.throwsAnError() // Throws any error
    assertThat { someBlockOfCode }.doesNotThrowAnError() // Doesn't throws any error

Browse the code and test cases for more complete examples.
