//
//  WeatherMetaAPI.swift
//  Weather Forecast
//
//  Created by Shcheng on 2021/2/6.
//  Copyright © 2021 VolvoCar. All rights reserved.
//

import Foundation

// global variable date of Tomorrow
let nextDate: String = getTomorrowDate()

/**
 * request Metaweather data with woeid
 */
struct MetaWetherWoeidAPI {
    let woeid: Int
    
    public init(woeid: Int) {
        self.woeid = woeid
    }
    
    var method: String = "GET"
    var url: String {
        return "https://www.metaweather.com/api/location/\(woeid)/"
    }
}

/**
 * request Metaweather data with date
 */
struct MetaWetherDateAPI {
    let woeid: Int
    let date: String
    
    public init(woeid: Int, date: String = nextDate) {
        self.woeid = woeid
        self.date = date
    }
    
    var method: String = "GET"
    var url: String {
        return "https://www.metaweather.com/api/location/\(woeid)/\(date)"
    }
}

/**
 * request Metaweather woeid with city name.
 */
struct MetaWetherCityAPI {
    let cityName: String
    public init(cityName: String) {
        self.cityName = cityName
    }
    
    var method: String = "GET"
    var url: String {
        return "https://www.metaweather.com/api/location/search/?query=\(cityName)/"
    }
}

/**
 * get  Tommorrow date with String
 */
func getTomorrowDate() -> String {
    let current = Date()
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "yyyy/MM/dd"
    let nextDate:TimeInterval = TimeInterval(24*60*60)
    let stringDate = current.addingTimeInterval(nextDate)
    return dateformatter.string(from: stringDate)
}
