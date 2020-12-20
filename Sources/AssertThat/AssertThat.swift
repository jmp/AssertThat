public func assertThat<T>(_ expression: @autoclosure () throws -> T) -> Assertion<T> {
    Assertion(subject: try! expression())
}
