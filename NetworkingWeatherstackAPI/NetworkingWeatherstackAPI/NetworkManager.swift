//
//  NetworkManager.swift
//  NetworkingWeatherstackAPI
//
//  Created by Hanisa Hilole on 28/3/2025.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchWeather() async throws -> CityWeather {
        let endpoint = "https://api.weatherstack.com/current?access_key=95f6f8972a3d3f99d46eed20398b3818&query=New York"
        guard let url = URL(string: endpoint) else {
            throw WSError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw WSError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(CityWeather.self, from: data)
        } catch {
            throw WSError.invalidData
        }
    }
    
}

struct CityWeather: Codable {
    let name: String
    let temperature: Int
    let sunrise: String
}


enum WSError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
