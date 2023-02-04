import XCTest

public extension Assertion where Subject: Numeric {
    @discardableResult
    func isOne(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertEqual(subject, 1, file: file, line: line)
        return self
    }

    @discardableResult
    func isNotOne(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertNotEqual(subject, 1, file: file, line: line)
        return self
    }
}

public extension Assertion where Subject: Numeric & Comparable {
    @discardableResult
    func isPositive(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertGreaterThan(subject, 0, file: file, line: line)
        return self
    }

    @discardableResult
    func isNotPositive(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertLessThanOrEqual(subject, 0, file: file, line: line)
        return self
    }

    @discardableResult
    func isNegative(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertLessThan(subject, 0, file: file, line: line)
        return self
    }

    @discardableResult
    func isNotNegative(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertGreaterThanOrEqual(subject, 0, file: file, line: line)
        return self
    }
}
