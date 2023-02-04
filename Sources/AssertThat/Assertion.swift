/// A generic struct for making assertions.
///
/// Each `Assertion` has a subject whose type is defined by the generic parameter `Subject`.
/// Assertion methods such as `isEqualTo` can be defined in extensions. The extensions
/// may restrict `Subject` to specific protocols or types.
public struct Assertion<Subject> {
    /// The subject of the assertion
    public let subject: Subject
}
