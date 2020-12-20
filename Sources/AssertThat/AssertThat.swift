public func assertThat<T>(_ expression: @escaping @autoclosure () throws -> T) -> Assertion<T> {
    Assertion(expression: expression)
}
