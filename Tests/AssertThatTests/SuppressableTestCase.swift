import XCTest

class SuppressableTestCase: XCTestCase {
    private(set) var suppressedIssues = 0
    private var isSuppressing = false

    override func record(_ issue: XCTIssue) {
        if isSuppressing {
            suppressedIssues += 1
        } else {
            super.record(issue)
        }
    }

    func suppress(_ block: () -> Void) {
        suppressedIssues = 0
        isSuppressing = true
        defer { isSuppressing = false }
        block()
    }
}
