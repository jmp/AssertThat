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

    func testIsOneSuccess() {
        suppress { assertThat(1).isOne() }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsOneFailure() {
        suppress { assertThat(0).isOne() }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testIsNotOneSuccess() {
        suppress { assertThat(0).isNotOne() }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsNotOneFailure() {
        suppress { assertThat(1).isNotOne() }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testIsPositiveSuccess() {
        suppress { assertThat(1).isPositive() }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsPositiveFailure() {
        suppress { assertThat(0).isPositive() }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testIsNotPositiveSuccess() {
        suppress { assertThat(0).isNotPositive() }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsNotPositiveFailure() {
        suppress { assertThat(1).isNotPositive() }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testIsNegativeSuccess() {
        suppress { assertThat(-1).isNegative() }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsNegativeFailure() {
        suppress { assertThat(0).isNegative() }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testIsNotNegativeSuccess() {
        suppress { assertThat(0).isNotNegative() }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsNotNegativeFailure() {
        suppress { assertThat(-1).isNotNegative() }
        XCTAssertEqual(1, suppressedIssues)
    }
}
