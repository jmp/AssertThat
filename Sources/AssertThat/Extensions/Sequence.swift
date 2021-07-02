import XCTest

public extension Assertion where Subject: Sequence, Subject.Element: Equatable {
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
