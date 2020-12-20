import XCTest

public extension Assertion where Subject == Bool {
    @discardableResult func isTrue(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(subject, file: file, line: line)
        return self
    }

    @discardableResult func isFalse(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject, file: file, line: line)
        return self
    }
}
