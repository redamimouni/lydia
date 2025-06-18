//
//  RandomUser.swift
//  Lydia
//
//  Created by Reda Mimouni on 17/06/2025.
//

struct RandomUser {
    let fullName: String
    let address: String
    let email: String
}

extension UserDTO {
    func toDomain() -> RandomUser {
        RandomUser(
            fullName: "\(name.title) \(name.first) \(name.last)",
            address: "\(location.street.number) \(location.street.name), \(location.city)",
            email: "\(email)"
        )
    }
}
