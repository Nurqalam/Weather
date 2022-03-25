//
//  CurrentWeather.swift
//  Weather
//
//  Created by Nurqalam on 25.03.2022.
//

import Foundation


struct CurrentWeather {
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return "\(temperature.rounded())"
    }
    
    let feelsLikeTemp: Double
    var feelsLikeTempString: String {
        return "\(feelsLikeTemp.rounded())"
    }
    
    let conditionID: Int
    
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemp = currentWeatherData.main.feels_like
        conditionID = currentWeatherData.weather.first!.id
    }
}
