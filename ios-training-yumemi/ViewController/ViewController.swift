//
//  ViewController.swift
//  ios-training-yumemi
//
//  Created by 松中誉生 on 2021/08/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    var weatherModel: WeatherModel = WeatherModel()
    
    var weatherImages: [Weather: UIImage] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 画像取得
        for weather in Weather.allCases {
            guard let image = UIImage(named: weather.rawValue) else {
                continue
            }
            
            weatherImages[weather] = image
        }
        
        // 天気を取得
        weatherModel.getWeather()
        
        // 天気を表示
        reloadWeatherImage()
    }

    @IBAction func reloadButtonTapped(_ sender: Any) {
        weatherModel.getWeather()
        reloadWeatherImage()
    }
    
    /// 天気画像を更新する
    func reloadWeatherImage() {
        guard
            let weather = weatherModel.weather,
            let image = weatherImages[weather]
        else {
            return
        }
        weatherImageView.image = image
        weatherImageView.tintColor = weather.color
    }
}
