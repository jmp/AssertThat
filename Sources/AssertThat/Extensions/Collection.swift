import XCTest

public extension Assertion where Subject: Collection {
    @discardableResult
    func isEmpty(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(subject.isEmpty, file: file, line: line)
        return self
    }

    @discardableResult
    func isNotEmpty(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.isEmpty, file: file, line: line)
        return self
    }
}
