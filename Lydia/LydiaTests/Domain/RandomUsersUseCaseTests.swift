//
//  RandomUsersUseCaseTests.swift
//  Lydia
//
//  Created by Reda Mimouni on 19/06/2025.
//

import Testing
@testable import Lydia
import Foundation

@Suite
struct RandomUsersUseCaseTests {

    @Test("fetchRandomUsers returns mapped domain users on success")
    func testSuccess() async throws {
        let dto = UserDTO.mock
        let mockRepo = MockRandomUsersFetcherRepository(result: .success([dto]))
        let useCase = RandomUsersUseCase(randomUsersRepository: mockRepo)

        let users = try await useCase.fetchRandomUsers(page: 1)

        #expect(users.count == 1)
        #expect(users.first?.fullName == "Monsieur Reda Mimouni")
        #expect(users.first?.email == "reda.mimouni@example.com")
        #expect(users.first?.address == "9427 rue de la fontaine, Roubaix")
    }

    @Test("fetchRandomUsers throws on failure")
    func testFailure() async throws {
        let mockRepo = MockRandomUsersFetcherRepository(result: .failure(NSError(domain: "domain", code: 400, userInfo: nil)))
        let useCase = RandomUsersUseCase(randomUsersRepository: mockRepo)

        do {
            _ = try await useCase.fetchRandomUsers(page: 1)
            #expect(Bool(false), "Expected error to be thrown")
        } catch let error as NSError {
            #expect(error.code == 400)
        } catch {
            #expect(Bool(false), "Unexpected error type")
        }
    }
}
