import XCTest

public extension Assertion where Subject: StringProtocol {
    @discardableResult
    func matches(_ pattern: String, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertTrue(
            subject.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil,
            "\"\(subject)\" does not match \"\(pattern)\"",
            file: file,
            line: line
        )
        return self
    }

    @discardableResult
    func doesNotMatch(_ pattern: String, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertFalse(
            subject.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil,
            "\"\(subject)\" matches \"\(pattern)\"",
            file: file,
            line: line
        )
        return self
    }
}
