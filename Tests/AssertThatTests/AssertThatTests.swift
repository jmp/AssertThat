import XCTest
@testable import AssertThat

final class AssertThatTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(AssertThat().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
