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
    private let spinnerView = SpinnerViewController()
    
    var textLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
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
                weatherData = try await networkManager.getCityWeather(city: "Sydney")
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
        createSpinnerView()
//        textLabel.text = "City: , Temperature, 0 , Sunrise:  "
        view.backgroundColor = .systemBackground
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }
    
    func createSpinnerView() {

        // add the spinner view controller
        addChild(spinnerView)
        spinnerView.view.frame = view.frame
        view.addSubview(spinnerView.view)
        spinnerView.didMove(toParent: self)


    }
    
    private func refreshView() {
        
        // wait two seconds to simulate some work happening
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // then remove the spinner view controller
                self.spinnerView.willMove(toParent: nil)
                self.spinnerView.view.removeFromSuperview()
                self.spinnerView.removeFromParent()
                
                self.textLabel.text = "City: \(self.weatherData?.location.name ?? ""), Temperature: \(self.weatherData?.current.temperature ?? 0), \nSunrise: \(self.weatherData?.current.astro.sunrise ?? "")"
            }
        
        
    }


}

class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        spinner.color = .gray
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
