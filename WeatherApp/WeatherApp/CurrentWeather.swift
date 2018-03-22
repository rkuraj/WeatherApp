//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Robert Kuraj on 21.03.2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation

class CurrentWeather {
    let temperature: Int?
    let apparentTemperature: Int?
    let icon: String?
    let summary: String?
    
    struct WeatherDictKeys {
        static let temp = "temperature"
        static let apparentTemp = "apparentTemperature"
        static let icon = "icon"
        static let summary = "summary"
    }
    
    init(weatherDictionary:[String:Any]) {
        self.temperature = weatherDictionary[WeatherDictKeys.temp] as? Int
        self.icon = weatherDictionary[WeatherDictKeys.icon] as? String
        self.apparentTemperature = weatherDictionary[WeatherDictKeys.apparentTemp] as? Int
        self.summary = weatherDictionary[WeatherDictKeys.summary] as? String
    }
}
