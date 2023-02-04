import XCTest
import AssertThat

final class StringProtocolTests: SuppressableTestCase {
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
