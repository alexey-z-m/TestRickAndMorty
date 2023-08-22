//
//  Characters.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import Foundation

struct Characters: Decodable {
    let info: InfoCharacters
    let results: [CharacterSchema]
}

struct InfoCharacters: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct CharacterSchema: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String

}

struct Location: Decodable {
    let name: String
    let url: String
}

struct DetailsLocation: Decodable {
    let id: Int
    let name: String
    let type: String
}

struct Episode: Decodable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
}

