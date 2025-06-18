import Foundation

// MARK: - WelcomeDTO
extension WelcomeDTO {
    static func mock(
        results: [TestDTO] = [.mock()]
    ) -> WelcomeDTO {
        return .init(results: results)
    }
}

// MARK: - TestDTO
extension TestDTO {
    static func mock(name: String = "name") -> TestDTO {
        return .init(name: name)
    }
}
