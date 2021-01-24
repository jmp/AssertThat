import XCTest
import AssertThat

final class BoolTests: SuppressableTestCase {
    func testIsTrueSuccess() {
        suppress { assertThat(true).isTrue() }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsTrueFailure() {
        suppress { assertThat(false).isTrue() }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testIsFalseSuccess() {
        suppress { assertThat(false).isFalse() }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsFalseFailure() {
        suppress { assertThat(true).isFalse() }
        XCTAssertEqual(1, suppressedIssues)
    }
}
