import XCTest

public extension Assertion where Subject == Any? {
    @discardableResult
    func isNil(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertNil(subject, file: file, line: line)
        return self
    }

    @discardableResult
    func isNotNil(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertNotNil(subject, file: file, line: line)
        return self
    }
}
