import XCTest

public extension Assertion where Subject: Numeric {
    @discardableResult func isZero(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertEqual(0, subject)
        return self
    }

    @discardableResult func isNotZero(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertNotEqual(0, subject)
        return self
    }
}
