import XCTest
import AssertThat

final class StringProtocolTests: SuppressableTestCase {
    func testStartsWithSuccess() {
        suppress { assertThat("foo").startsWith("f") }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testStartsWithFailure() {
        suppress { assertThat("foo").startsWith("x") }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testDoesNotStartWithSuccess() {
        suppress { assertThat("foo").doesNotStartWith("x") }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testDoesNotStartWithFailure() {
        suppress { assertThat("foo").doesNotStartWith("f") }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testEndsWithSuccess() {
        suppress { assertThat("foo").endsWith("o") }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testEndsWithFailure() {
        suppress { assertThat("foo").endsWith("x") }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testDoesNotEndWithSuccess() {
        suppress { assertThat("foo").doesNotEndWith("x") }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testDoesNotEndWithFailure() {
        suppress { assertThat("foo").doesNotEndWith("o") }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testMatchesSuccess() {
        suppress { assertThat("foo").matches("^fo.$") }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testMatchesFailure() {
        suppress { assertThat("foo").matches("^bar$") }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testDoesNotMatchSuccess() {
        suppress { assertThat("foo").doesNotMatch("^bar$") }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testDoesNotMatchFailure() {
        suppress { assertThat("foo").doesNotMatch("^fo.$") }
        XCTAssertEqual(1, suppressedIssues)
    }
}
