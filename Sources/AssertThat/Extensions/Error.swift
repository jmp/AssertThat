import XCTest

public extension Assertion where Subject: Error & Equatable {
    @discardableResult func isThrownBy<T>(_ block: () throws -> T, file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try block()
        } catch {
            if error as? Subject != subject {
                XCTFail("\(error) is not \(subject)", file: file, line: line)
            }
            return self
        }
        XCTFail("\(subject) was not thrown", file: file, line: line)
        return self
    }

    @discardableResult func isNotThrownBy<T>(_ block: () throws -> T, file: StaticString = #filePath, line: UInt = #line) -> Self {
        do {
            _ = try block()
        } catch {
            if error as? Subject == subject {
                XCTFail("\(subject) was thrown", file: file, line: line)
            }
        }
        return self
    }
}
