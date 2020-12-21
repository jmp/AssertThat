import XCTest
import AssertThat

final class ClosureTests: SuppressableTestCase {
    private enum TestError: Error {
        case test
        case other
    }

    func testThrowsAnErrorSuccess() {
        suppress {
            assertThat { throw TestError.test }.throwsAnError()
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testThrowsAnErrorFailure() {
        suppress {
            assertThat {}.throwsAnError()
        }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testDoesNotThrowAnErrorSuccess() {
        suppress {
            assertThat {}.doesNotThrowAnError()
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testDoesNotThrowAnErrorFailure() {
        suppress {
            assertThat { throw TestError.test }.doesNotThrowAnError()
        }
        XCTAssertEqual(1, suppressedIssues)
    }
    
    func testThrowsSuccess() {
        suppress {
            assertThat { throw TestError.test }.throws(TestError.test)
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testThrowsFailure() {
        suppress {
            assertThat {}.throws(TestError.other)
            assertThat { throw TestError.test }.throws(TestError.other)
        }
        XCTAssertEqual(2, suppressedIssues)
    }

    func testDoesNotThrowSuccess() {
        suppress {
            assertThat {}.doesNotThrow(TestError.test)
            assertThat { throw TestError.other }.doesNotThrow(TestError.test)
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testDoesNotThrowFailure() {
        suppress {
            assertThat { throw TestError.test }.doesNotThrow(TestError.test)
        }
        XCTAssertEqual(1, suppressedIssues)
    }

    static var allTests = [
        ("testThrowsAnErrorSuccess", testThrowsAnErrorSuccess),
        ("testThrowsAnErrorFailure", testThrowsAnErrorFailure),
        ("testDoesNotThrowAnErrorSuccess", testDoesNotThrowAnErrorSuccess),
        ("testDoesNotThrowAnErrorFailure", testDoesNotThrowAnErrorFailure),
        ("testThrowsSuccess", testThrowsSuccess),
        ("testThrowsFailure", testThrowsFailure),
        ("testDoesNotThrowSuccess", testDoesNotThrowSuccess),
        ("testDoesNotThrowFailure", testDoesNotThrowFailure),
    ]
}
