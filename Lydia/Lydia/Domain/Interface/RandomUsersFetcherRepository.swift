//
//  RandomUsersFetcherRepository.swift
//  Lydia
//
//  Created by Reda Mimouni on 17/06/2025.
//

import Foundation

protocol RandomUsersFetcherRepository {
    func fetchRandomUsers(limit: Int, page: Int) async throws -> [UserDTO]
    func fetchImage(url: String?) async throws -> Data?
}
