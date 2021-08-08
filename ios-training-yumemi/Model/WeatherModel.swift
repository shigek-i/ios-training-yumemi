//
//  WeatherModel.swift
//  ios-training-yumemi
//
//  Created by 松中誉生 on 2021/08/09.
//

import Foundation
import YumemiWeather
import UIKit

enum Weather: String, CaseIterable {
    case sunny
    case cloudy
    case rainy
    
    var color: UIColor {
        switch self {
        case .sunny: return UIColor.red
        case .cloudy: return UIColor.gray
        case .rainy: return UIColor.blue
        }
    }
}

struct WeatherModel {
    var weather: Weather?
    
    mutating func getWeather() {
        guard let weather = Weather(rawValue: YumemiWeather.fetchWeather()) else {
            return
        }
        self.weather = weather
    }
}
