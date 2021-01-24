import XCTest
import AssertThat

final class ErrorTests: SuppressableTestCase {
    private enum TestError: Error {
        case test
        case other
    }

    func testIsThrownBySuccess() {
        suppress {
            assertThat(TestError.test).isThrownBy {
                throw TestError.test
            }
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsThrownByFailure() {
        suppress {
            assertThat(TestError.test).isThrownBy {}
            assertThat(TestError.test).isThrownBy {
                throw TestError.other
            }
        }
        XCTAssertEqual(2, suppressedIssues)
    }

    func testIsNotThrownBySuccess() {
        suppress {
            assertThat(TestError.test).isNotThrownBy {}
            assertThat(TestError.test).isNotThrownBy {
                throw TestError.other
            }
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsNotThrownByFailure() {
        suppress {
            assertThat(TestError.test).isNotThrownBy {
                throw TestError.test
            }
        }
        XCTAssertEqual(1, suppressedIssues)
    }
}
