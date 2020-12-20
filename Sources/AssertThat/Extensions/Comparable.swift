import XCTest

public extension Assertion where Subject: Comparable {
    @discardableResult func isLessThan(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertLessThan(subject, other, file: file, line: line)
        return self
    }
    
    @discardableResult func isLessThanOrEqualTo(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertLessThanOrEqual(subject, other, file: file, line: line)
        return self
    }
    
    @discardableResult func isGreaterThan(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertGreaterThan(subject, other, file: file, line: line)
        return self
    }
    
    @discardableResult func isGreaterThanOrEqualTo(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertGreaterThanOrEqual(subject, other, file: file, line: line)
        return self
    }
}
