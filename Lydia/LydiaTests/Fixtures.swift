//
//  Fixtures.swift
//  Lydia
//
//  Created by Reda Mimouni on 18/06/2025.
//

@testable import Lydia

extension NameDTO {
    static var mock: NameDTO {
        .init(title: "Monsieur", first: "Reda", last: "Mimouni")
    }
}

extension LocationDTO {
    static var mock: LocationDTO {
        .init(street: .mock, city: "Roubaix", state: "Finistère", country: "France", coordinates: .mock, timezone: .mock)
    }
}

extension StreetDTO {
    static var mock: StreetDTO {
        .init(number: 9427, name: "rue de la fontaine")
    }
}

extension CoordinatesDTO {
    static var mock: CoordinatesDTO {
        .init(latitude: "49.9167", longitude: "-2.15")
    }
}

extension TimezoneDTO {
    static var mock: TimezoneDTO {
        .init(offset: "-01:00", description: "Europe/Paris")
    }
}

extension LoginDTO {
    static var mock: LoginDTO {
        .init(uuid: "a4d3e5e4-e55e-4f7e-a66e-e4e5e5e5e5e5", username: "crazycat123", password: "password", salt: "YjVyZGZhZmE5ZjY2ZjY2Zj", md5: "e4d3e5e4e55ee5f7ea66e4e5e5e5e5e5", sha1: "e4d3e5e4e55ee5f7ea66e4e5e5e5e5e5e5e5e5e5", sha256: "e4d3e5e4e55ee5f7ea66e4e5e5e5e5e5e5e5e5e5e5e5e5e5e5e5e5e5e5e5e5e5")
    }
}

extension PictureDTO {
    static var mock: PictureDTO {
        .init(large: "https://randomuser.me/api/portraits/men/83.jpg", medium: "https://randomuser.me/api/portraits/med/men/83.jpg", thumbnail: "https://randomuser.me/api/portraits/thumb/men/83.jpg")
    }
}

extension DobDTO {
    static var mock: DobDTO {
        .init(date: "1990-07-21T11:54:15Z", age: 32)
    }
}

extension IdentifierDTO {
    static var mock: IdentifierDTO {
        .init(name: "", value: "")
    }
}

extension UserDTO {
    static var mock: UserDTO {
        .init(
            gender: "gender",
            name: .mock,
            location: .mock,
            email: "reda.mimouni@example.com",
            login: .mock,
            dob: .mock,
            registered: .mock,
            phone: "phone",
            cell: "cell",
            id: .mock,
            picture: .mock,
            nat: "nat"
        )
    }
}
