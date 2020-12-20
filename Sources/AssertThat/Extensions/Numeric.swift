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

    @discardableResult func isPositive(file: StaticString = #filePath, line: UInt = #line) -> Self where Subject: Comparable {
        XCTAssertGreaterThan(subject, 0)
        return self
    }

    @discardableResult func isNotPositive(file: StaticString = #filePath, line: UInt = #line) -> Self where Subject: Comparable {
        XCTAssertLessThanOrEqual(subject, 0)
        return self
    }

    @discardableResult func isNegative(file: StaticString = #filePath, line: UInt = #line) -> Self where Subject: Comparable {
        XCTAssertLessThan(subject, 0)
        return self
    }

    @discardableResult func isNotNegative(file: StaticString = #filePath, line: UInt = #line) -> Self where Subject: Comparable {
        XCTAssertGreaterThanOrEqual(subject, 0)
        return self
    }
}
