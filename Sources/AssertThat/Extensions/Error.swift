import XCTest

public extension Assertion where Subject: Error & Equatable {
    @discardableResult
    func isThrownBy<T>(_ block: () throws -> T, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertThrowsError(try block(), "\(subject) was not thrown", file: file, line: line) { error in
            XCTAssertTrue(error as? Subject == subject, "\(error) is not \(subject)", file: file, line: line)
        }
        return self
    }

    @discardableResult
    func isNotThrownBy<T>(_ block: () throws -> T, file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try block()
        } catch {
            XCTAssertFalse(error as? Subject == subject, "\(subject) was thrown", file: file, line: line)
        }
        return self
    }
}
