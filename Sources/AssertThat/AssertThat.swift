public func assertThat<Subject>(_ subject: Subject) -> Assertion<Subject> {
    Assertion(subject: subject)
}
