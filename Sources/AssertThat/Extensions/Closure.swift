import XCTest

public extension Assertion where Subject == () throws -> Any {
    @discardableResult
    func throwsAnError(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertThrowsError(try subject(), "no error was thrown", file: file, line: line)
        return self
    }

    @discardableResult
    func doesNotThrowAnError(file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertNoThrow(try subject(), "an error was thrown", file: file, line: line)
        return self
    }

    @discardableResult
    func `throws`<T: Error & Equatable>(
        _ expectedError: T,
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> Self {
        XCTAssertThrowsError(try subject(), "\(expectedError) was not thrown", file: file, line: line) { error in
            XCTAssertTrue(error as? T == expectedError, "\(error) is not \(expectedError)", file: file, line: line)
        }
        return self
    }

    @discardableResult
    func doesNotThrow<T: Error & Equatable>(
        _ expectedError: T,
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> Self {
        do {
            _ = try subject()
        } catch {
            XCTAssertFalse(error as? T == expectedError, "\(expectedError) was thrown", file: file, line: line)
        }
        return self
    }

    @discardableResult
    func `throws`<T: Error>(_ expectedError: T.Type, file: StaticString = #filePath, line: UInt = #line) -> Self {
        XCTAssertThrowsError(try subject(), "\(expectedError) was not thrown", file: file, line: line) { error in
            XCTAssertTrue(type(of: error) == T.self, "\(error) is not \(expectedError)", file: file, line: line)
        }
        return self
    }

    @discardableResult
    func doesNotThrow<T: Error>(_ expectedError: T.Type, file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try subject()
        } catch {
            XCTAssertFalse(type(of: error) == T.self, "\(expectedError) was thrown", file: file, line: line)
        }
        return self
    }
}
