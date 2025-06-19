//
//  RandomUsersFetcherRepository.swift
//  Lydia
//
//  Created by Reda Mimouni on 17/06/2025.
//

protocol RandomUsersFetcherRepository {
    func fetchRandomUsers(limit: Int, page: Int) async throws -> [UserDTO]
}
