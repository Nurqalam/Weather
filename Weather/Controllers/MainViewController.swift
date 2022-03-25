//
//  ViewController.swift
//  Weather
//
//  Created by Nurqalam on 25.03.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var networkWeatherManager = NetworkWeatherManager()
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapRounded()
        
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else {return}
            self.updateInterfaceWith(weather: currentWeather)
        }
        
        networkWeatherManager.fetchingWeatherManager(withCity: "Aktau")
    }

    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        presentSearchAlertController(withTitle: title, message: nil, style: .alert) { [unowned self] (city) in
            self.networkWeatherManager.fetchingWeatherManager(withCity: city)
        }
    }
    
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLikeTempLabel.text = weather.feelsLikeTempString
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
}

