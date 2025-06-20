//
//  RandomUsersUseCase.swift
//  Lydia
//
//  Created by Reda Mimouni on 17/06/2025.
//

import APICaller

final class RandomUsersUseCase {
    private let randomUsersRepository: any RandomUsersFetcherRepository
    
    init(randomUsersRepository: some RandomUsersFetcherRepository) {
        self.randomUsersRepository = randomUsersRepository
    }
    
    func fetchRandomUsers(page: Int) async throws -> [RandomUser] {
        let dtos = try await randomUsersRepository.fetchRandomUsers(limit: 20, page: page)
        return try await withThrowingTaskGroup(of: RandomUser.self) { [weak self] group in
            guard let self else { return [] }
            for dto in dtos {
                group.addTask {
                    try await dto.toDomain(using: self.randomUsersRepository.fetchImage(url:))
                }
            }
            var users: [RandomUser] = []
            for try await user in group {
                users.append(user)
            }
            return users
        }
    }
}
