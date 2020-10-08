//
//  ViewController.swift
//  GrahamApp
//
//  Created by Anna Brdak on 04/09/2020.
//  Copyright © 2020 Anna Brdak. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var weatherManager = WeatherManager.shared
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var voltageLabel: UILabel!
    @IBOutlet weak var pm2_5Label: UILabel!
    @IBOutlet weak var pm10Label: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        weatherManager.delegate = self
        loadData()
        super.viewDidLoad()
        activityIndicator.startAnimating()
    }
    
    func loadData() {
        weatherManager.getWeather { _ in }
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate{
    
    func didUpdateWeather(weather: WeatherModel) {
        
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureToDisplay
            self.humidityLabel.text = weather.humidityToDisplay
            self.pressureLabel.text = weather.pressureToDisplay
            self.voltageLabel.text = weather.voltageToDisplay
            self.pm2_5Label.text = weather.pm2_5
            self.pm10Label.text = weather.pm10
            self.conditionImageView.image = UIImage(systemName: weather.thermometerImage)
            self.activityIndicator.stopAnimating()
        }
    }
}

