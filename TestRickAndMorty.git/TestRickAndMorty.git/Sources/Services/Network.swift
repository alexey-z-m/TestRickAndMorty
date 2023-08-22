//
//  Network.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import Foundation
import Combine

class Network {
    static var detailsCharacter: CharacterSchema?
    static var detailsLocation: DetailsLocation?
    static var detailsEpisodes = [Episode]()
    enum NetworkError: Error {
        case InvalidURL
        case JSONDecodingError
        case RequestError(String)
    }

    struct ResponseErrorMessage: Codable {
        let error: String
    }

    func getDataByURL(url: String) async throws -> Data {
        if let url = URL(string: url) {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                let error: ResponseErrorMessage = try decodeJSONData(data: data)
                throw NetworkError.RequestError(error.error)
            }
            return data
        } else {
            throw(NetworkError.InvalidURL)
        }
    }

    func decodeJSONData<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.JSONDecodingError
        }
    }

    func getCharacterByURL(url: String) async throws -> CharacterSchema {
        let characterData = try await getDataByURL(url: url)
        let character: CharacterSchema = try decodeJSONData(data: characterData)
        return character
    }

    func getCharacterByID(id: Int, completion: @escaping (CharacterSchema) -> ()) async throws {
        let character = try await getCharacterByURL(url: "https://rickandmortyapi.com/api/character/\(id)")
        completion(character)
    }

    func getAllCharacters(completion: @escaping ([CharacterSchema]) -> ()) async throws {
        var allChar = [CharacterSchema]()
        do {
            let data = try await getDataByURL(url: "https://rickandmortyapi.com/api/character")
            let characters: Characters = try decodeJSONData(data: data)
            for index in 1...characters.info.count {
                let character = try await getCharacterByURL(url: "https://rickandmortyapi.com/api/character/\(index)")
                allChar.append(character)
            }
        }
        allChar = allChar.sorted { $0.id < $1.id }
        completion(allChar)
    }

//    func getLoacationByURL(url: String, completion: @escaping ((DetailsLocation) -> ())) async throws  {
//        do {
//            let loacationData = try await getDataByURL(url: url)
//            let loacation: DetailsLocation = try decodeJSONData(data: loacationData)
//            completion(loacation)
//        }
//    }

    func getDetails(urlLocations: String, urlEpisodes:[String], completion: @escaping (DetailsLocation?, [Episode]) -> ()) async throws {
        do {
            var loacation: DetailsLocation? = nil
            if (urlLocations != "") {
                let loacationData = try await getDataByURL(url: urlLocations)
                loacation = try decodeJSONData(data: loacationData)
            }
            var episodes = [Episode]()
            if urlEpisodes.count != 0 {
                for index in  0..<urlEpisodes.count {
                    let episodesData = try await getDataByURL(url: urlEpisodes[index])
                    let episode: Episode = try decodeJSONData(data: episodesData)
                    episodes.append(episode)
                }
            }
            completion(loacation,episodes)
        }
    }

}
