import XCTest
import AssertThat

final class OptionalTests: SuppressableTestCase {
    func testIsNilSuccess() {
        suppress { assertThat(nil as Bool?).isNil() }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsNilFailure() {
        suppress { assertThat(true as Bool?).isNil() }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testIsNotNilSuccess() {
        suppress { assertThat(true as Bool?).isNotNil() }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsNotNilFailure() {
        suppress { assertThat(nil as Bool?).isNotNil() }
        XCTAssertEqual(1, suppressedIssues)
    }

    static var allTests = [
        ("testIsNilSuccess", testIsNilSuccess),
        ("testIsNilFailure", testIsNilFailure),
        ("testIsNotNilSuccess", testIsNotNilSuccess),
        ("testIsNotNilFailure", testIsNotNilFailure),
    ]
}
