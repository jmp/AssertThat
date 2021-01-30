public struct Assertion<Subject> {
    public let expression: () throws -> Subject

    public var subject: Subject {
        try! expression() // swiftlint:disable:this force_try
    }
}
