//
//  RandomUsersFetcherRepositoryImplementation.swift
//  Lydia
//
//  Created by Reda Mimouni on 17/06/2025.
//

import APICaller
import Foundation

final class RandomUsersFetcherRepositoryImplementation: RandomUsersFetcherRepository {
    private let apiCaller: any APICallerProtocol
    
    init(apiCaller: some APICallerProtocol = APICaller()) {
        self.apiCaller = apiCaller
    }
    
    func fetchRandomUsers(limit: Int) async throws -> [UserDTO] {
        do {
            let request = URLRequest.request(from: APIEndpoints.listing(with: limit))
            let dto: RandomUserDTO = try await self.apiCaller.perform(request, fallbackCache: true)
            return dto.results
        } catch is CustomError {
            throw CustomError.parsingError
        } catch {
            throw CustomError.errorDataFetch
        }
    }
}
