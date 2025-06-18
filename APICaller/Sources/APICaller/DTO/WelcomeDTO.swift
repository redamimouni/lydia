//
//  TestDTO.swift
//  APICaller
//
//  Created by Reda Mimouni on 18/06/2025.
//

// MARK: - WelcomeDTO
struct WelcomeDTO: Decodable, Equatable {
    let results: [TestDTO]
}

// MARK: - TestDTO
struct TestDTO: Decodable, Equatable {
    let name: String
}
