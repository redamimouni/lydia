//
//  RandomUsersViewModel.swift
//  Lydia
//
//  Created by Reda Mimouni on 17/06/2025.
//

final class RandomUsersViewModel {
    private let useCase: RandomUsersUseCase
    
    init(useCase: RandomUsersUseCase) {
        self.useCase = useCase
    }

    func fetchRandomUsers() async throws -> [RandomUser] {
        return try await useCase.fetchRandomUsers()
    }
}
