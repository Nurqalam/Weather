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
        return "\(Int(temperature))º"
    }
    
    let feelsLikeTemp: Double
    var feelsLikeTempString: String {
        return "Feels Like \(Int(feelsLikeTemp))º"
    }
    
    let conditionID: Int
    var systemIconNameString: String {
        switch conditionID {
        case 200...232:
            return "cloud.bolt.rain.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 701...781:
            return "smoke.fill"
        case 800:
            return "sun.min.fill"
        case 801...804:
            return "cloud.fill"
        default:
            return "nosign"
        }
    }
    
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemp = currentWeatherData.main.feels_like
        conditionID = currentWeatherData.weather.first!.id
    }
}
