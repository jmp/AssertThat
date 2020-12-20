import XCTest

public extension Assertion where Subject: Error & Equatable {
    @discardableResult func isThrownBy<T>(_ block: () throws -> T, file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try block()
        } catch {
            if error as? Subject != subject {
                XCTFail("Expected \(error) to be \(subject)", file: file, line: line)
            }
            return self
        }
        XCTFail("Expected \(subject) to be thrown")
        return self
    }

    @discardableResult func isNotThrownBy<T>(_ block: () throws -> T, file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try block()
        } catch {
            if error as? Subject == subject {
                XCTFail("Expected \(subject) not to be thrown")
            }
        }
        return self
    }
}
