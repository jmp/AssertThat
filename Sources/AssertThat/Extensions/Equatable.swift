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

    @discardableResult func isIn<T>(_ iterable: T, file: StaticString = #filePath, line: UInt = #line) -> Self where T: Sequence {
        for item in iterable {
            if item as? Subject == subject {
                return self
            }
        }
        XCTFail("\(subject) is not in \(iterable)")
        return self
    }

    @discardableResult func isNotIn<T>(_ iterable: T, file: StaticString = #filePath, line: UInt = #line) -> Self where T: Sequence {
        for item in iterable {
            if item as? Subject == subject {
                XCTFail("\(subject) is in \(iterable)")
                return self
            }
        }
        return self
    }
}
