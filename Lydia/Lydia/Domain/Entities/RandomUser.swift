//
//  RandomUser.swift
//  Lydia
//
//  Created by Reda Mimouni on 17/06/2025.
//

import Foundation

struct RandomUser {
    let gender: String
    let fullName: String
    let address: String
    let email: String
    let phone: String
    let picture: Data?
}

extension UserDTO {
    func toDomain(using fetchImage: (String?) async throws -> Data?) async throws -> RandomUser {
        let imageData: Data?
        if let url = picture.large {
            do {
                imageData = try await fetchImage(url)
            } catch {
                imageData = nil
            }
        } else {
            imageData = nil
        }

        return RandomUser(
            gender: gender,
            fullName: "\(name.title) \(name.first) \(name.last)",
            address: "\(location.street.number) \(location.street.name), \(location.city)",
            email: email,
            phone: phone,
            picture: imageData
        )
    }
}
