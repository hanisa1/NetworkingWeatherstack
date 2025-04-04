//
//  ViewController.swift
//  NetworkingWeatherstackAPI
//
//  Created by Hanisa Hilole on 28/3/2025.
//

import UIKit

class ViewController: UIViewController {
    
    private var weatherData: WeatherData?
    private var networkManager = NetworkManager.shared
    
    var textLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "hello"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
        
        Task {
            do {
                weatherData = try await networkManager.getCityWeather(city: "New York")
                DispatchQueue.main.async {
                    self.refreshView()
                }
            } catch WSError.invalidURL {
                print("invalid URL")
            } catch WSError.invalidResponse {
                print("invalid Response")
            } catch WSError.invalidData {
                print("invalid Data")
            } catch {
                print("unexpected error: \(error)")
            }
            
        }
    }
    
    private func setupView() {
        
        textLabel.text = "City: , Temperature, 0 , Sunrise:  "
        view.backgroundColor = .systemBackground
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }
    
    private func refreshView() {
        textLabel.text = "City: \(weatherData?.location.name ?? ""), Temperature, \(weatherData?.current.temperature ?? 0), \nSunrise: \(weatherData?.current.astro.sunrise ?? "")"
    }


}

