//
//  Mocks.swift
//  Lydia
//
//  Created by Reda Mimouni on 18/06/2025.
//

import APICaller
@testable import Lydia
import Foundation

public final class MockAPICaller: APICallerProtocol {

    public enum Scenario : Sendable{
        case success(Data)
        case failure(Error)
    }

    public let scenario: Scenario

    public init(scenario: Scenario) {
        self.scenario = scenario
    }

    public func perform<T>(_ request: URLRequest?, fallbackCache: Bool) async throws -> T where T : Decodable {
        switch scenario {
        case .success(let data):
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw CustomError.parsingError
            }
        case .failure(let error):
            throw error
        }
    }
}

public final class MockRandomUsersFetcherRepository: RandomUsersFetcherRepository {
    let result: Result<[UserDTO], Error>
    
    init(result: Result<[UserDTO], Error>) {
        self.result = result
    }

    public func fetchRandomUsers(limit: Int, page: Int) async throws -> [UserDTO] {
        try result.get()
    }
}
