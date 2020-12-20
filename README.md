# AssertThat

This library tries to make AssertJ-style readable assertions usable Swift.

It is currently experimental and super work in progress.

The idea is that instead of having to write things like `XCTAssertEqual("foo", "bar")` we can write
something like this instead:

    assertThat("foo").isEqualTo("bar")

This also allows more complicated chains of assertions, for example:

    assertThat("The quick brown fox")
        .startsWith("The")
        .contains("brown")
        .endsWith("fox")

It should also allow the use of extensions to support custom assertions.
