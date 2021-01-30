import XCTest

public extension Assertion where Subject: FloatingPoint {
    @discardableResult
    func isCloseTo(_ expected: Subject, offset: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertEqual(subject, expected, accuracy: offset, file: file, line: line)
        return self
    }

    @discardableResult
    func isNotCloseTo(
        _ expected: Subject,
        offset: Subject,
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> Self {
        XCTAssertNotEqual(subject, expected, accuracy: offset, file: file, line: line)
        return self
    }

    @discardableResult
    func isNaN(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(subject.isNaN, file: file, line: line)
        return self
    }

    @discardableResult
    func isNotNaN(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.isNaN, file: file, line: line)
        return self
    }
}
