//
//  RandomUsersFetcherRepositoryTests.swift
//  Lydia
//
//  Created by Reda Mimouni on 18/06/2025.
//

import Testing
import APICaller
import Foundation
@testable import Lydia

@Suite
struct RandomUsersFetcherRepositoryTests {
    @Test("fetchRandomUsers returns valid users when successful")
    func testFetchSuccess() async throws {
        let userDTOMock: UserDTO = .mock
        let dto = RandomUserDTO(
            results: [userDTOMock],
            info: .init(seed: "seed", results: 12, page: 4, version: "version")
        )
        let repo = RandomUsersFetcherRepositoryImplementation(apiCaller: MockAPICaller(scenario: .success(try JSONEncoder().encode(dto))))
        let users = try await repo.fetchRandomUsers(limit: 1, page: 1)

        #expect(users.count == 1)
        #expect(users.first?.name.first == "Reda")
    }

    @Test("fetchRandomUsers throws parsing error if decoding fails")
    func testParsingError() async throws {
        let repo = RandomUsersFetcherRepositoryImplementation(apiCaller: MockAPICaller(scenario: .failure(CustomError.parsingError)))

        do {
            _ = try await repo.fetchRandomUsers(limit: 1, page: 1)
            #expect(Bool(false), "Expected CustomError.parsingError")
        } catch let error as CustomError {
            #expect(error == .parsingError)
        } catch {
            #expect(Bool(false), "Unexpected error: \(error)")
        }
    }
    
    @Test("fetchRandomUsers throws generic fetch error on unexpected failure")
    func testUnknownError() async throws {
        let repo = RandomUsersFetcherRepositoryImplementation(apiCaller: MockAPICaller(scenario: .failure(URLError.init(.unknown))))

        do {
            _ = try await repo.fetchRandomUsers(limit: 1, page: 1)
            #expect(Bool(false), "Expected CustomError.errorDataFetch")
        } catch let error as CustomError {
            #expect(error == .errorDataFetch)
        } catch {
            #expect(Bool(false), "Unexpected error: \(error)")
        }
    }
}
