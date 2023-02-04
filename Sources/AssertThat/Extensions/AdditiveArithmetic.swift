import XCTest

public extension Assertion where Subject: AdditiveArithmetic {
    @discardableResult
    func isZero(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertEqual(subject, .zero, file: file, line: line)
        return self
    }

    @discardableResult
    func isNotZero(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertNotEqual(subject, .zero, file: file, line: line)
        return self
    }
}
