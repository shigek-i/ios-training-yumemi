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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 天気を取得
        weatherModel.getWeather()
        
        // 天気を表示
        reloadWeatherImage()
    }

    @IBAction func reloadButtonTapped(_ sender: Any) {
    }
    
    /// 天気画像を更新する
    func reloadWeatherImage() {
        guard
            let weather = weatherModel.weather,
            let image = UIImage(named: weather.rawValue)
        else {
            return
        }
        
        weatherImageView.image = image
    }
}
