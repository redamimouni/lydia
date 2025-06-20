//
//  RandomUsersViewModel.swift
//  Lydia
//
//  Created by Reda Mimouni on 17/06/2025.
//

final class RandomUsersViewModel {
    private let useCase: any RandomUsersUseCaseProtocol

    private(set) var users: [RandomUser] = []
    private(set) var isLoading = false
    private(set) var error: Error?

    init(useCase: some RandomUsersUseCaseProtocol) {
        self.useCase = useCase
    }

    func fetchRandomUsers(page: Int) async {
        if page == 1 {
            users.removeAll()
        }
        isLoading = true
        defer { isLoading = false }
        do {
            let newUsers = try await useCase.fetchRandomUsers(page: page)
            users += newUsers
            print(users)
        } catch {
            self.error = error
        }
    }
}
