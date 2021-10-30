import XCTest

class SuppressableTestCase: XCTestCase {
    private(set) var suppressedIssues = 0

#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
    override func record(_ issue: XCTIssue) {
        suppressedIssues += 1
    }
#else
    override func recordFailure(
        withDescription description: String,
        inFile filePath: String,
        atLine lineNumber: Int,
        expected: Bool
    ) {
        suppressedIssues += 1
    }
#endif

    func suppress(_ block: () -> Void) {
        suppressedIssues = 0
        block()
    }
}
