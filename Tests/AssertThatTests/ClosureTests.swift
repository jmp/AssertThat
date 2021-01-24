import XCTest
import AssertThat

final class ClosureTests: SuppressableTestCase {
    private enum TestError: Error {
        case test
        case other
    }

    private struct OtherError: Error {}

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

    func testThrowsErrorTypeSuccess() {
        suppress {
            assertThat { throw TestError.test }.throws(TestError.self)
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testThrowsErrorTypeFailure() {
        suppress {
            assertThat {}.throws(TestError.self)
            assertThat { throw OtherError() }.throws(TestError.self)
        }
        XCTAssertEqual(2, suppressedIssues)
    }

    func testDoesNotThrowErrorTypeSuccess() {
        suppress {
            assertThat {}.doesNotThrow(TestError.self)
            assertThat { throw OtherError() }.doesNotThrow(TestError.self)
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testDoesNotThrowErrorTypeFailure() {
        suppress {
            assertThat { throw TestError.test }.doesNotThrow(TestError.self)
        }
        XCTAssertEqual(1, suppressedIssues)
    }
}
