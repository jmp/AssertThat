/// Create a new assertion for the given subject.
///
/// The function takes a subject (e.g. an integer or an expression) as its only argument and
/// returns an ``Assertion`` instance. The methods of the return value can be used to
/// verify that a wanted condition is true.
///
/// - Parameters:
///    - subject: The subject of the assertion
///
/// - Returns: A new ``Assertion`` instance for the given subject.
public func assertThat<Subject>(_ subject: Subject) -> Assertion<Subject> {
    Assertion(subject: subject)
}
