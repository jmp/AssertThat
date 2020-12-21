import XCTest

public extension Assertion where Subject == () throws -> Any {
    @discardableResult func throwsAnError(file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try expression()()
            XCTFail("nothing was thrown", file: file, line: line)
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
            XCTFail("\(error) was thrown", file: file, line: line)
        }
        return self
    }

    @discardableResult func `throws`<T: Error & Equatable>(_ expectedError: T, file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try expression()()
            XCTFail("\(expectedError) was not thrown", file: file, line: line)
            return self
        } catch {
            if error as? T != expectedError {
                XCTFail("\(error) is not \(expectedError)", file: file, line: line)
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
                XCTFail("\(expectedError) was thrown", file: file, line: line)
            }
        }
        return self
    }

    @discardableResult func `throws`<T: Error>(_ expectedError: T.Type, file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try expression()()
            XCTFail("\(expectedError) was not thrown", file: file, line: line)
            return self
        } catch {
            if !(type(of: error) == T.self) {
                XCTFail("\(error) is not \(expectedError)", file: file, line: line)
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
                XCTFail("\(expectedError) was thrown", file: file, line: line)
            }
        }
        return self
    }
}
