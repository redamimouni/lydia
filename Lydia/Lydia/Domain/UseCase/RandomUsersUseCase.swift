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
    
    func fetchRandomUsers() async throws -> [RandomUser] {
        try await randomUsersRepository.fetchRandomUsers(limit: 10).map {
            $0.toDomain()
        }
    }
}
