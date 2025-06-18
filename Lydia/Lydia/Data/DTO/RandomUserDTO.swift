//
//  RandomUserDTO.swift
//  Lydia
//
//  Created by Reda Mimouni on 17/06/2025.
//

import Foundation

// MARK: - RandomUserDTO
struct RandomUserDTO: Codable {
    let results: [UserDTO]
    let info: InfoDTO
}

// MARK: - InfoDTO
struct InfoDTO: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

// MARK: - UserDTO
struct UserDTO: Codable {
    let gender: String
    let name: NameDTO
    let location: LocationDTO
    let email: String
    let login: LoginDTO
    let dob, registered: DobDTO
    let phone, cell: String
    let id: IdentifierDTO
    let picture: PictureDTO
    let nat: String
}

// MARK: - DobDTO
struct DobDTO: Codable {
    let date: String
    let age: Int
}

// MARK: - IdentifierDTO
struct IdentifierDTO: Codable {
    let name, value: String?
}

// MARK: - LocationDTO
struct LocationDTO: Codable {
    let street: StreetDTO
    let city, state, country: String
    let coordinates: CoordinatesDTO
    let timezone: TimezoneDTO
}

// MARK: - CoordinatesDTO
struct CoordinatesDTO: Codable {
    let latitude, longitude: String
}

// MARK: - StreetDTO
struct StreetDTO: Codable {
    let number: Int
    let name: String
}

// MARK: - TimezoneDTO
struct TimezoneDTO: Codable {
    let offset, description: String
}

// MARK: - LoginDTO
struct LoginDTO: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

// MARK: - NameDTO
struct NameDTO: Codable {
    let title, first, last: String
}

// MARK: - PictureDTO
struct PictureDTO: Codable {
    let large, medium, thumbnail: String?
}
