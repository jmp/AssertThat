import XCTest

public extension Assertion where Subject: StringProtocol {
    @discardableResult func isEmpty(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(subject.isEmpty, file: file, line: line)
        return self
    }

    @discardableResult func isNotEmpty(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.isEmpty, file: file, line: line)
        return self
    }

    @discardableResult func startsWith(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(subject.starts(with: other), file: file, line: line)
        return self
    }

    @discardableResult func doesNotStartWith(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.starts(with: other), file: file, line: line)
        return self
    }

    @discardableResult func endsWith(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(subject.hasSuffix(other), file: file, line: line)
        return self
    }

    @discardableResult func doesNotEndWith(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.hasSuffix(other), file: file, line: line)
        return self
    }

    @discardableResult func contains(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(subject.contains(other), file: file, line: line)
        return self
    }

    @discardableResult func doesNotContain(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.contains(other), file: file, line: line)
        return self
    }

    @discardableResult func matches(_ pattern: String, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(subject.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil, file: file, line: line)
        return self
    }

    @discardableResult func doesNotMatch(_ pattern: String, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil, file: file, line: line)
        return self
    }
}
