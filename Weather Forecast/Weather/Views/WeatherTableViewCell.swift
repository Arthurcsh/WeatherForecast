//
//  WeatherTableViewCell.swift
//  Weather Forecast
//
//  Created by Shcheng on 2021/2/6.
//  Copyright © 2021 VolvoCar. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    let imageUrl = "https://www.metaweather.com/static/img/weather/png/"
    let imageFormatter = ".png"    // png formatter
    var dateLabel: UILabel!        // date info
    var weatherLabel: UILabel!     // weather state
    var weatherState: UIImageView! // state image
    var windSpeedLabel: UILabel!   // wind speed
    var maxTmpLabel: UILabel!      // max temperature
    var minTmpLabel: UILabel!      // min temperature

    var item: ConsolidatedWeather! {
        didSet{
           loadWeatherData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        drawWeatherView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/**
 * pragma mark - Extensions
 */
extension WeatherTableViewCell {
    // layout for weather view
    func drawWeatherView() {
        dateLabel = UILabel.Builder().withOfSize(14).withWeight(.regular).withTextAligment(.left).withTextColor(.darkGray).build()
        self.addSubview(dateLabel)
        dateLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
   
        weatherState = UIImageView.Builder().build()
        self.addSubview(weatherState)
        weatherState.widthAnchor.constraint(equalToConstant: 54).isActive = true
        weatherState.heightAnchor.constraint(equalToConstant: 54).isActive = true
        weatherState.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        weatherState.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5).isActive = true
        weatherState.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        windSpeedLabel = UILabel.Builder().withOfSize(13).withWeight(.regular).withTextAligment(.left).withTextColor(.darkGray).build()
        self.addSubview(windSpeedLabel)
        windSpeedLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        windSpeedLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        
        
        weatherLabel = UILabel.Builder().withOfSize(13).withWeight(.regular).withTextAligment(.left).withTextColor(.darkGray).build()
        weatherLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 13)
        self.addSubview(weatherLabel)
        weatherLabel.leftAnchor.constraint(equalTo: weatherState.rightAnchor, constant: 5).isActive = true
        weatherLabel.bottomAnchor.constraint(equalTo: weatherState.bottomAnchor, constant: -6).isActive = true
       
        minTmpLabel = UILabel.Builder().withOfSize(13).withWeight(.regular).withTextAligment(.right).withTextColor(.darkGray).build()
        self.addSubview(minTmpLabel)
        minTmpLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        minTmpLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        
        maxTmpLabel = UILabel.Builder().withOfSize(13).withWeight(.regular).withTextAligment(.right).withTextColor(.darkGray).build()
        self.addSubview(maxTmpLabel)
        maxTmpLabel.rightAnchor.constraint(equalTo: minTmpLabel.leftAnchor, constant: -10).isActive = true
        maxTmpLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
    
    // display view with weather data
    func loadWeatherData() {
        dateLabel.text = item.applicable_date.stringEEEddMM()
        weatherLabel.text = item.weather_state_name
        windSpeedLabel.text = "Wind speed: \(Int(item.wind_speed)) mph"
        guard let iconUrl = URL(string: imageUrl + item.weather_state_abbr + imageFormatter) else {
            fatalError("fail to create uri")
        }
        
        weatherState.loadImage(url: iconUrl)
        minTmpLabel.text = "Min: \(Int(item.min_temp)) °C"
        maxTmpLabel.text = "Max: \(Int(item.max_temp)) °C"
    }
}
