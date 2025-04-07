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
    
    let apiKey: String = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String

    
    func getCityWeather(city: String) async throws -> WeatherData {
        let endpoint = "https://api.weatherstack.com/current?access_key=\(apiKey)&query=\(city)"
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
            return try decoder.decode(WeatherData.self, from: data)
            
        } catch {
            throw WSError.invalidData
        }
    }
    
}

struct WeatherData: Codable {
    let location: Location
    let current: CurrentWeather
}

// MARK: - Location
struct Location: Codable {
    let name: String
}

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let temperature: Int
    let astro: Astro

    enum CodingKeys: String, CodingKey {
        case temperature
        case astro
    }
}

// MARK: - Astro
struct Astro: Codable {
    let sunrise: String
}


enum WSError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
