import XCTest

public extension Assertion where Subject: Sequence, Subject.Element: Equatable {
    @discardableResult
    func startsWith(_ prefix: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(
            subject.starts(with: prefix),
            "\"\(subject)\" does not start with \"\(prefix)\"",
            file: file,
            line: line
        )
        return self
    }

    @discardableResult
    func doesNotStartWith(_ prefix: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.starts(with: prefix), "\"\(subject)\" starts with \"\(prefix)\"", file: file, line: line)
        return self
    }

    @discardableResult
    func endsWith(_ suffix: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(
            subject.reversed().starts(with: suffix.reversed()),
            "\"\(subject)\" does not end with \"\(suffix)\"",
            file: file,
            line: line
        )
        return self
    }

    @discardableResult
    func doesNotEndWith(_ suffix: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.reversed().starts(with: suffix.reversed()), "\"\(subject)\" ends with \"\(suffix)\"", file: file, line: line)
        return self
    }

    @discardableResult
    func contains(_ element: Subject.Element, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(subject.contains(element), file: file, line: line)
        return self
    }

    @discardableResult
    func doesNotContain(_ element: Subject.Element, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(subject.contains(element), file: file, line: line)
        return self
    }
}
