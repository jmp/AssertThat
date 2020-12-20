import XCTest

public extension Assertion where Subject: Numeric {
    @discardableResult func isZero(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertEqual(subject, 0)
        return self
    }

    @discardableResult func isNotZero(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertNotEqual(subject, 0)
        return self
    }
}

public extension Assertion where Subject: Numeric & Comparable {
    @discardableResult func isPositive(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertGreaterThan(subject, 0)
        return self
    }

    @discardableResult func isNotPositive(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertLessThanOrEqual(subject, 0)
        return self
    }

    @discardableResult func isNegative(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertLessThan(subject, 0)
        return self
    }

    @discardableResult func isNotNegative(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertGreaterThanOrEqual(subject, 0)
        return self
    }
}
