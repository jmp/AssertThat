import XCTest
import AssertThat

final class CollectionTests: SuppressableTestCase {
    func testIsEmptySuccess() {
        suppress { assertThat([]).isEmpty() }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsEmptyFailure() {
        suppress { assertThat([1]).isEmpty() }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testIsNotEmptySuccess() {
        suppress { assertThat([1]).isNotEmpty() }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsNotEmptyFailure() {
        suppress { assertThat([]).isNotEmpty() }
        XCTAssertEqual(1, suppressedIssues)
    }
}
