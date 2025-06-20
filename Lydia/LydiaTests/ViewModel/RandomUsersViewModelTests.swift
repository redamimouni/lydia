//
//  RandomUsersViewModelTests.swift
//  Lydia
//
//  Created by Reda Mimouni on 20/06/2025.
//


import Testing
@testable import Lydia
import Foundation

@Suite
struct RandomUsersViewModelTests {

    @Test("fetchRandomUsers store users")
    func testFetchSuccessPage1() async throws {
        let mockUsers = [
            RandomUser(gender: "male", fullName: "Reda", address: "Paris", email: "r@a.com", phone: "0600000000", picture: nil)
        ]
        let mockUseCase = MockRandomUsersUseCase()
        mockUseCase.resultsByPage = [1: mockUsers]
        let viewModel = RandomUsersViewModel(useCase: mockUseCase)

        await viewModel.fetchRandomUsers(page: 1)

        #expect(viewModel.isLoading == false)
        #expect(viewModel.users == mockUsers)
        #expect(viewModel.error == nil)
    }

    @Test("fetchRandomUsers append users when pagination")
    func testFetchAppendsOnPage2() async throws {
        let page1Users = [
            RandomUser(gender: "male", fullName: "Reda", address: "Paris", email: "r@a.com", phone: "0600000000", picture: nil)
        ]
        let page2Users = [
            RandomUser(gender: "female", fullName: "Lina", address: "Lyon", email: "l@a.com", phone: "0700000000", picture: nil)
        ]

        let useCase = MockRandomUsersUseCase()
        useCase.resultsByPage = [
            1: page1Users,
            2: page2Users
        ]

        let viewModel = RandomUsersViewModel(useCase: useCase)

        await viewModel.fetchRandomUsers(page: 1)
        await viewModel.fetchRandomUsers(page: 2)

        #expect(viewModel.users == page1Users + page2Users)
    }


    @Test("fetchRandomUsers delete users when page == 1")
    func testResetUsersOnPage1() async throws {
        let page1Users = [
            RandomUser(gender: "male", fullName: "Reda", address: "Paris", email: "r@a.com", phone: "0600000000", picture: nil)
        ]
        let page2Users = [
            RandomUser(gender: "female", fullName: "Lina", address: "Lyon", email: "l@a.com", phone: "0700000000", picture: nil)
        ]
        let useCase = MockRandomUsersUseCase()
        useCase.resultsByPage = [
            1: page1Users,
            2: page2Users
        ]
        let viewModel = RandomUsersViewModel(useCase: useCase)

        await viewModel.fetchRandomUsers(page: 1)
        await viewModel.fetchRandomUsers(page: 2)
        await viewModel.fetchRandomUsers(page: 1)

        #expect(viewModel.users == page1Users)
    }

    @Test("fetchRandomUsers catch error")
    func testFetchFailure() async throws {
        let useCase = MockRandomUsersUseCase()
        useCase.errorsByPage = [1: NSError(domain: "", code: 400, userInfo: nil)]
        let viewModel = RandomUsersViewModel(useCase: useCase)

        await viewModel.fetchRandomUsers(page: 1)

        #expect(viewModel.users.isEmpty)
        #expect((viewModel.error as? NSError)?.code == 400)
        #expect(viewModel.isLoading == false)
    }
}
