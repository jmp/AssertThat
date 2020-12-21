import XCTest

public extension Assertion where Subject: StringProtocol {
    @discardableResult func isEmpty(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(subject.isEmpty, "\"\(subject)\" is not empty", file: file, line: line)
        return self
    }

    @discardableResult func isNotEmpty(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.isEmpty, "\"\(subject)\" is empty", file: file, line: line)
        return self
    }

    @discardableResult func startsWith(_ prefix: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(subject.starts(with: prefix), "\"\(subject)\" does not start with \"\(prefix)\"", file: file, line: line)
        return self
    }

    @discardableResult func doesNotStartWith(_ prefix: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.starts(with: prefix), "\"\(subject)\" starts with \"\(prefix)\"", file: file, line: line)
        return self
    }

    @discardableResult func endsWith(_ suffix: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(subject.hasSuffix(suffix), "\"\(subject)\" does not end with \"\(suffix)\"", file: file, line: line)
        return self
    }

    @discardableResult func doesNotEndWith(_ suffix: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.hasSuffix(suffix), "\"\(subject)\" ends with \"\(suffix)\"", file: file, line: line)
        return self
    }

    @discardableResult func contains(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(subject.contains(other), "\"\(subject)\" does not contain \"\(other)\"", file: file, line: line)
        return self
    }

    @discardableResult func doesNotContain(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.contains(other), "\"\(subject)\" contains \"\(other)\"", file: file, line: line)
        return self
    }

    @discardableResult func matches(_ pattern: String, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(subject.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil, "\"\(subject)\" does not match \"\(pattern)\"", file: file, line: line)
        return self
    }

    @discardableResult func doesNotMatch(_ pattern: String, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil, "\"\(subject)\" matches \"\(pattern)\"", file: file, line: line)
        return self
    }
}
