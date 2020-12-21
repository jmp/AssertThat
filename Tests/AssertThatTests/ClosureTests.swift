import XCTest
import AssertThat

final class ClosureTests: SuppressableTestCase {
    private struct TestError: Error {}

    func testThrowsAnErrorSuccess() {
        suppress {
            assertThat { throw TestError() }.throwsAnError()
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
            assertThat { throw TestError() }.doesNotThrowAnError()
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
