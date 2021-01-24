import XCTest
import AssertThat

final class AssertThatTests: XCTestCase {
    func testAssertThatReturnsAssertion() {
        let assertion = assertThat("dummy") as Any
        XCTAssertTrue(assertion is Assertion<String>)
    }
}
