import XCTest

public extension Assertion where Subject: Equatable {
    @discardableResult func isEqualTo(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertEqual(subject, other, file: file, line: line)
        return self
    }

    @discardableResult func isNotEqualTo(_ other: Subject, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertNotEqual(subject, other, file: file, line: line)
        return self
    }

    @discardableResult func isIn<S>(_ sequence: S, file: StaticString = #filePath, line: UInt = #line) -> Self where S: Sequence, Subject == S.Element {
        XCTAssertTrue(sequence.contains { $0 == subject }, "\(sequence) does not contain \(subject)", file: file, line: line)
        return self
    }

    @discardableResult func isNotIn<S>(_ sequence: S, file: StaticString = #filePath, line: UInt = #line) -> Self where S: Sequence, Subject == S.Element {
        XCTAssertFalse(sequence.contains { $0 == subject }, "\(sequence) contains \(subject)", file: file, line: line)
        return self
    }
}
