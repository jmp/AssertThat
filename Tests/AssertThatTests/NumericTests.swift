import XCTest
import AssertThat

final class NumericTests: SuppressableTestCase {
    func testIsZeroSuccess() {
        suppress { assertThat(0).isZero() }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsZeroFailure() {
        suppress { assertThat(1).isZero() }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testIsNotZeroSuccess() {
        suppress { assertThat(1).isNotZero() }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsNotZeroFailure() {
        suppress { assertThat(0).isNotZero() }
        XCTAssertEqual(1, suppressedIssues)
    }

    static var allTests = [
        ("testIsZeroSuccess", testIsZeroSuccess),
        ("testIsZeroFailure", testIsZeroFailure),
        ("testIsNotZeroSuccess", testIsNotZeroSuccess),
        ("testIsNotZeroFailure", testIsNotZeroFailure),
    ]
}
