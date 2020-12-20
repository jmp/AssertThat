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
