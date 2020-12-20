import XCTest

public extension Assertion where Subject: Equatable {
    @discardableResult func isEqualTo(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertEqual(subject, other, file: file, line: line)
        return self
    }

    @discardableResult func isNotEqualTo(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertNotEqual(subject, other, file: file, line: line)
        return self
    }
}
