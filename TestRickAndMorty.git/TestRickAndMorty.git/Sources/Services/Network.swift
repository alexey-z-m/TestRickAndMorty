//
//  Network.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import Foundation

class Network {
    static var dataCharacters = [CharacterSchema]()

    static func getDataCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        let configuration: URLSessionConfiguration = .default
        configuration.allowsCellularAccess = true
        configuration.waitsForConnectivity = true
        let session = URLSession(configuration: configuration)
        session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let jsonData = try decoder.decode(Characters.self, from: data)
                            dataCharacters.append(contentsOf: jsonData.results)
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        }.resume()
    }
}
