import XCTest
import AssertThat

final class EquatableAssertionTests: SuppressableTestCase {
    func testIsEqualToSuccess() {
        suppress { assertThat(1).isEqualTo(1) }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsEqualToFailure() {
        suppress { assertThat(1).isEqualTo(2) }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testIsNotEqualToSuccess() {
        suppress { assertThat(1).isNotEqualTo(2) }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsNotEqualToFailure() {
        suppress { assertThat(1).isNotEqualTo(1) }
        XCTAssertEqual(1, suppressedIssues)
    }

    static var allTests = [
        ("testIsEqualToSuccess", testIsEqualToSuccess),
        ("testIsEqualToFailure", testIsEqualToFailure),
        ("testIsNotEqualToPositive", testIsNotEqualToSuccess),
        ("testIsNotEqualToNegative", testIsNotEqualToFailure),
    ]
}
