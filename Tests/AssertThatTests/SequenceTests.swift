import XCTest
import AssertThat

final class SequenceTests: SuppressableTestCase {
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

    func testContainsSuccess() {
        suppress { assertThat([1, 2, 3]).contains(2) }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testContainsFailure() {
        suppress { assertThat([1, 2, 3]).contains(4) }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testDoesNotContainSuccess() {
        suppress { assertThat([1, 2, 3]).doesNotContain(4) }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testDoesNotContainFailure() {
        suppress { assertThat([1, 2, 3]).doesNotContain(2) }
        XCTAssertEqual(1, suppressedIssues)
    }
}
