//
//  ViewController.swift
//  NetworkingWeatherstackAPI
//
//  Created by Hanisa Hilole on 28/3/2025.
//

import UIKit

class ViewController: UIViewController {
    
    var textLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "hello"
        label.textColor = .black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
         
        
        
    }


}

