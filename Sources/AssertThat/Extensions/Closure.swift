import XCTest

public extension Assertion where Subject == () throws -> Any {
    @discardableResult func throwsAnError(file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try expression()()
            XCTFail("Expected an error to be thrown", file: file, line: line)
            return self
        } catch {
            return self
        }
    }

    @discardableResult func doesNotThrowAnError(file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try expression()()
            return self
        } catch {
            XCTFail("Expected no error to be thrown but \(error) was thrown", file: file, line: line)
        }
        return self
    }
}
