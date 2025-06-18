import Foundation
import XCTest
@testable import APICaller

final class APICallerTests: XCTestCase {
    @MainActor
    func test_perform_shouldReturnWelcomeDTO() async throws {
        // Given
        let resultJson = #"{"results": [{"name":"FirstName"}, {"name":"SecondName"}]}"#
        let sessionMock = URLSessionMock()
        let data = try XCTUnwrap(resultJson.data(using: .utf8), "fail to unwrap")
        let responseMock = HTTPURLResponse(url: .init(string: "www.image.fr")!, statusCode: 200, httpVersion: nil, headerFields: nil)! as URLResponse
        sessionMock.stubbedFetchResult = (data, responseMock)
        let sut = APICaller(urlSession: sessionMock)

        // When
        do {
            let result: WelcomeDTO = try await sut.perform(.init(url: .init(string: "www.image.fr")!), fallbackCache: true)

            // Then
            XCTAssertEqual(result, .mock(results: [.mock(name: "FirstName"), .mock(name: "SecondName")]), "wrong should be equal to TestDTO mock")
        } catch {
            XCTFail("Should not throw error \(error)")
        }
    }

    @MainActor
    func test_perform_welcome_shouldThrowParsingError() async throws {
        // Given
        let resultJson = #"{"toto":[{"idTeam": "1", "strTeam": "PSG", "strBadge": "www.test.fr/image.jpg"}]}"#
        let sessionMock = URLSessionMock()
        let data = try XCTUnwrap(resultJson.data(using: .utf8), "fail to unwrap")
        let responseMock = HTTPURLResponse(url: .init(string: "www.image.fr")!, statusCode: 200, httpVersion: nil, headerFields: nil)! as URLResponse
        sessionMock.stubbedFetchResult = (data, responseMock)
        let sut = APICaller(urlSession: sessionMock)

        // When
        do {
            let _: WelcomeDTO = try await sut.perform(.init(url: .init(string: "www.image.fr")!), fallbackCache: true)

            // Then
            XCTFail("Should throw error")
        } catch {
            XCTAssertEqual(error.localizedDescription, "Parsing data error", "wrong should throw Parsing data error")
        }
    }

    @MainActor
    func test_perform_shouldThrowHttpRequestError() async throws {
        // Given
        let resultJson = #"{"results": [{"name":"FirstName", "name":"SecondName"}]}"#
        let sessionMock = URLSessionMock()
        let data = try XCTUnwrap(resultJson.data(using: .utf8), "fail to unwrap")
        sessionMock.stubbedFetchResult = (data, URLResponse())
        let sut = APICaller(urlSession: sessionMock)

        // When
        do {
            let _: WelcomeDTO = try await sut.perform(.init(url: .init(string: "www.image.fr")!), fallbackCache: true)

            // Then
            XCTFail("Should throw error")
        } catch {
            XCTAssertEqual(error.localizedDescription, "HTTP request error", "wrong should throw HTTP request error")
        }
    }
}

@MainActor
final class URLSessionMock: URLSessionProtocol {
    func dataWithFallback(with request: URLRequest) async throws -> (Data, URLResponse) {
        guard let result = stubbedFetchResult else { throw CustomError.httpRequestError }
        return result
    }
    
    var stubbedFetchResult: (Data, URLResponse)?

    func data(with request: URLRequest) async throws -> (Data, URLResponse) {
        guard let result = stubbedFetchResult else { throw CustomError.httpRequestError }
        return result
    }
}
