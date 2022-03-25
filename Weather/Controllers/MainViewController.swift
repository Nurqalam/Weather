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
    @IBOutlet weak var cityLabel: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapRounded()
        networkWeatherManager.delegate = self
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        presentSearchAlertController(withTitle: title, message: nil, style: .alert) { (city) in
            self.networkWeatherManager.fetchingWeatherManager(withCity: city) 
        }
    }
}

extension MainViewController: NetworkWeatherManagerDelegate {
    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather) {
        print(currentWeather.cityName)
    }
}
