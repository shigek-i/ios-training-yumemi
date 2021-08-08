//
//  WeatherModel.swift
//  ios-training-yumemi
//
//  Created by 松中誉生 on 2021/08/09.
//

import Foundation
import YumemiWeather

enum Weather: String {
    case sunny
    case cloudy
    case rainy
}

struct WeatherModel {
    var weather: Weather
    
    mutating func getWeather() {
        guard let weather = Weather(rawValue: YumemiWeather.fetchWeather()) else {
            return
        }
        self.weather = weather
    }
}
