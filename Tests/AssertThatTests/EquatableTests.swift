import XCTest
import AssertThat

final class EquatableTests: SuppressableTestCase {
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

    func testIsInSuccess() {
        suppress {
            assertThat(1).isIn([1, 2, 3])
            assertThat(1).isIn([1])
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    
    func testIsInFailure() {
        suppress {
            assertThat(1).isIn([])
            assertThat(0).isIn([1, 2, 3])
        }
        XCTAssertEqual(2, suppressedIssues)
    }

    func testIsNotInSuccess() {
        suppress {
            assertThat(1).isNotIn([])
            assertThat(0).isNotIn([1, 2, 3])
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    
    func testIsNotInFailure() {
        suppress { assertThat(1).isNotIn([1]) }
        XCTAssertEqual(1, suppressedIssues)
    }

    static var allTests = [
        ("testIsEqualToSuccess", testIsEqualToSuccess),
        ("testIsEqualToFailure", testIsEqualToFailure),
        ("testIsNotEqualToPositive", testIsNotEqualToSuccess),
        ("testIsNotEqualToNegative", testIsNotEqualToFailure),
        ("testIsInSuccess", testIsInSuccess),
        ("testIsInFailure", testIsInFailure),
    ]
}
