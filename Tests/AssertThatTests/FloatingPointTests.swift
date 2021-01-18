import XCTest
import AssertThat

final class FloatingPointTests: SuppressableTestCase {
    func testIsCloseToSuccess() {
        suppress {
            assertThat(0.0).isCloseTo(0.0, offset: 0.0)
            assertThat(5.0).isCloseTo(5.0, offset: 0.0)
            assertThat(4.9).isCloseTo(5.0, offset: 0.1)
            assertThat(4.9).isCloseTo(4.0, offset: 5.0)
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsCloseToFailure() {
        suppress {
            assertThat(0.0).isCloseTo(0.1, offset: 0.0)
            assertThat(5.0).isCloseTo(5.2, offset: 0.1)
        }
        XCTAssertEqual(2, suppressedIssues)
    }

    func testIsNotCloseToSuccess() {
        suppress {
            assertThat(0.0).isNotCloseTo(0.1, offset: 0.0)
            assertThat(5.0).isNotCloseTo(5.2, offset: 0.1)
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsNotCloseToFailure() {
        suppress {
            assertThat(0.0).isNotCloseTo(0.0, offset: 0.0)
            assertThat(5.0).isNotCloseTo(5.0, offset: 0.0)
            assertThat(4.9).isNotCloseTo(5.0, offset: 0.1)
            assertThat(4.9).isNotCloseTo(4.0, offset: 5.0)
        }
        XCTAssertEqual(4, suppressedIssues)
    }

    func testIsNaNSuccess() {
        suppress {
            assertThat(Float.nan).isNaN()
            assertThat(Double.nan).isNaN()
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsNaNFailure() {
        suppress {
            assertThat(Float.nan).isNotNaN()
            assertThat(Double.nan).isNotNaN()
        }
        XCTAssertEqual(2, suppressedIssues)
    }

    static var allTests = [
        ("testIsCloseToSuccess", testIsCloseToSuccess),
        ("testIsCloseToFailure", testIsCloseToFailure),
        ("testIsNotCloseToSuccess", testIsNotCloseToSuccess),
        ("testIsNotCloseToFailure", testIsNotCloseToFailure),
        ("testIsNaNSuccess", testIsNaNSuccess),
        ("testIsNaNFailure", testIsNaNFailure),
    ]
}
