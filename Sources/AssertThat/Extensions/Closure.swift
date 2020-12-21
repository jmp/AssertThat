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

    @discardableResult func `throws`<T: Error & Equatable>(_ expectedError: T, file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try expression()()
            XCTFail("Expected \(expectedError) to be thrown", file: file, line: line)
            return self
        } catch {
            if error as? T != expectedError {
                XCTFail("Expected \(expectedError) to be thrown, but \(error) was thrown", file: file, line: line)
            }
        }
        return self
    }

    
    @discardableResult func doesNotThrow<T: Error & Equatable>(_ expectedError: T, file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try expression()()
            return self
        } catch {
            if error as? T == expectedError {
                XCTFail("Expected \(expectedError) not to be thrown", file: file, line: line)
            }
        }
        return self
    }

    @discardableResult func `throws`<T: Error>(_ expectedError: T.Type, file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try expression()()
            XCTFail("Expected \(expectedError) to be thrown", file: file, line: line)
            return self
        } catch {
            if !(type(of: error) == T.self) {
                XCTFail("Expected \(expectedError) to be thrown, but \(error) was thrown", file: file, line: line)
            }
        }
        return self
    }

    @discardableResult func doesNotThrow<T: Error>(_ expectedError: T.Type, file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try expression()()
            return self
        } catch {
            if type(of: error) == T.self {
                XCTFail("Expected \(expectedError) not to be thrown", file: file, line: line)
            }
        }
        return self
    }
}
