import XCTest
import AssertThat

final class SequenceTests: SuppressableTestCase {
    func testContainsSuccess() {
        suppress { assertThat([1, 2, 3]).contains(2) }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testContainsFailure() {
        suppress { assertThat([1, 2, 3]).contains(4) }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testDoesNotContainSuccess() {
        suppress { assertThat([1, 2, 3]).doesNotContain(4) }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testDoesNotContainFailure() {
        suppress { assertThat([1, 2, 3]).doesNotContain(2) }
        XCTAssertEqual(1, suppressedIssues)
    }
}
