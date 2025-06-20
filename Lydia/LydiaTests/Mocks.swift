//
//  Mocks.swift
//  Lydia
//
//  Created by Reda Mimouni on 18/06/2025.
//

import APICaller
@testable import Lydia
import Foundation
 
struct MockAPICaller: APICallerProtocol {

    enum Scenario : Sendable{
        case success(Data)
        case failure(Error)
    }

    let scenario: Scenario

    init(scenario: Scenario) {
        self.scenario = scenario
    }

    func perform<T>(_ request: URLRequest?, fallbackCache: Bool) async throws -> T where T : Decodable {
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

struct MockRandomUsersFetcherRepository: RandomUsersFetcherRepository {
    let resultUsers: Result<[UserDTO], Error>
    let resultData: Result<Data, Error>

    func fetchRandomUsers(limit: Int, page: Int) async throws -> [UserDTO] {
        try resultUsers.get()
    }
    
    func fetchImage(url: String?) async throws -> Data? {
        try resultData.get()
    }
}

final class MockRandomUsersUseCase: RandomUsersUseCaseProtocol {
    var resultsByPage: [Int: [RandomUser]] = [:]
    var errorsByPage: [Int: Error] = [:]

    func fetchRandomUsers(page: Int) async throws -> [RandomUser] {
        if let error = errorsByPage[page] {
            throw error
        }
        return resultsByPage[page] ?? []
    }
}
