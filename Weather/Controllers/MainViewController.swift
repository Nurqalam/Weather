//
//  ViewController.swift
//  Weather
//
//  Created by Nurqalam on 25.03.2022.
//

import UIKit
import CoreLocation


class MainViewController: UIViewController {
    
    var networkWeatherManager = NetworkWeatherManager()
    
    lazy var locationManag: CLLocationManager = {
        let locationMng = CLLocationManager()
        locationMng.delegate = self
        locationMng.desiredAccuracy = kCLLocationAccuracyKilometer
        locationMng.requestWhenInUseAuthorization()
        return locationMng
    }()
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapRounded()
        
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            self?.updateInterfaceWith(weather: currentWeather)
        }
    
        if CLLocationManager.locationServicesEnabled() {
            locationManag.requestLocation()
        }
    }

    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        presentSearchAlertController(withTitle: title, message: nil, style: .alert) { [unowned self] (city) in
            self.networkWeatherManager.fetchCurrentWeather(forRequestType: .cityName(city: city))
        }
    }
    
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLikeTempLabel.text = weather.feelsLikeTempString
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
            self.backgroundImage.image = UIImage(named: weather.backgroundWeatherImage)
        }
    }
}


