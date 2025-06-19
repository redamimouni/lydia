//
//  RandomUsersUseCase.swift
//  Lydia
//
//  Created by Reda Mimouni on 17/06/2025.
//

final class RandomUsersUseCase {
    private let randomUsersRepository: any RandomUsersFetcherRepository
    
    init(randomUsersRepository: some RandomUsersFetcherRepository) {
        self.randomUsersRepository = randomUsersRepository
    }
    
    func fetchRandomUsers(page: Int) async throws -> [RandomUser] {
        try await randomUsersRepository.fetchRandomUsers(limit: 20, page: page).map {
            $0.toDomain()
        }
    }
}
