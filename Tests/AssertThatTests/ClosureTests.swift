import XCTest
import AssertThat

final class ClosureTests: SuppressableTestCase {
    private enum TestError: Error {
        case test
    }

    func testThrowsAnErrorSuccess() {
        suppress {
            assertThat {
                throw TestError.test
            }.throwsAnError()
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
            assertThat {
                throw TestError.test
            }.doesNotThrowAnError()
        }
        XCTAssertEqual(1, suppressedIssues)
    }

    static var allTests = [
        ("testThrowsAnErrorSuccess", testThrowsAnErrorSuccess),
        ("testThrowsAnErrorFailure", testThrowsAnErrorFailure),
        ("testDoesNotThrowAnErrorSuccess", testDoesNotThrowAnErrorSuccess),
        ("testDoesNotThrowAnErrorFailure", testDoesNotThrowAnErrorFailure),
    ]
}
