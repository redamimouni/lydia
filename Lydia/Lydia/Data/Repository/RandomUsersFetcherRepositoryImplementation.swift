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
    private let imageFetcher: any ImageFetcherProtocol
    
    init(apiCaller: some APICallerProtocol = APICaller(),
         imageFetcher: any ImageFetcherProtocol = ImageFetcher()) {
        self.apiCaller = apiCaller
        self.imageFetcher = imageFetcher
    }
    
    func fetchRandomUsers(limit: Int, page: Int) async throws -> [UserDTO] {
        do {
            let request = URLRequest.request(from: APIEndpoints.listing(with: limit, page: page))
            let dto: RandomUserDTO = try await self.apiCaller.perform(request, fallbackCache: true)
            return dto.results
        } catch is CustomError {
            throw CustomError.parsingError
        } catch {
            throw CustomError.errorDataFetch
        }
    }
    
    func fetchImage(url: String?) async throws -> Data? {
        guard let url else {
            return nil
        }
        return try await self.imageFetcher.fetchImageData(from: url)
    }
}
