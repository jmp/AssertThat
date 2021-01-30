import XCTest

class SuppressableTestCase: XCTestCase {
    private(set) var suppressedIssues = 0
    private var isSuppressing = false

    #if os(macOS) || os(iOS) || os(tvOS)
    override func record(_ issue: XCTIssue) {
        if isSuppressing {
            suppressedIssues += 1
        } else {
            super.record(issue)
        }
    }
    #else
    override func recordFailure(
        withDescription description: String,
        inFile filePath: String,
        atLine lineNumber: Int,
        expected: Bool
    ) {
        if isSuppressing {
            suppressedIssues += 1
        } else {
            super.recordFailure(withDescription: description, inFile: filePath, atLine: lineNumber, expected: expected)
        }
    }
    #endif

    func suppress(_ block: () -> Void) {
        suppressedIssues = 0
        isSuppressing = true
        defer { isSuppressing = false }
        block()
    }
}
