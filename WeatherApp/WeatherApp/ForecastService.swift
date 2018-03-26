//
//  Service.swift
//  WeatherApp
//
//  Created by Robert Kuraj on 26.03.2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import UIKit

protocol ForecastProtocol {
    var cityName:String {get set}
    var forecastSummary:String {get set}
    var forecastIcon:UIImage {get set}
    var forecastTemperature:String {get set}
    var forecastAppTemperature:String {get set}
}

class ForecastService {
    
    let cityName:String?
    var forecastProtocol:ForecastProtocol?
    
    init(cityName: String, forecastProtocol:ForecastProtocol) {
        self.cityName = cityName
        self.forecastProtocol = forecastProtocol
    }
    
    func getForecast() {
        
        let locationServ = LocationService(APIKey: APIKeys.GoogleAPIKey)
        
        locationServ.getCoordinationsForLocation(location: self.cityName!, completion: {
            (locationCoordinates) in
            
            self.forecastProtocol?.cityName = self.cityName!.uppercased()
            
            if let coordinates = locationCoordinates {
                let forecastServ = WeatherService(APIKey: APIKeys.WeatherAPIKet)
                forecastServ.getCurrentWeatherForCoordinates(coordinates: coordinates, completion: {
                    (weather) in
                    
                    DispatchQueue.main.async {
                        let presenter = WeatherPresenter()
                        
                        if let icon = weather?.icon {
                            print(icon)
                            self.forecastProtocol?.forecastIcon = presenter.getWeatherIcon(icon: icon)
                        }
                        
                        if let summary = weather?.summary {
                            print(summary)
                            self.forecastProtocol?.forecastSummary = summary.uppercased()
                        }
                        
                        if let temp = weather?.temperature {
                            let celsiusTemp = Double(temp-32) / 1.8
                            
                            print(celsiusTemp)
                            self.forecastProtocol?.forecastTemperature = String("\(Int(celsiusTemp))°C")
                        }
                        
                        if let appTemp = weather?.apparentTemperature {
                            let celsiusTemp = Double(appTemp-32) / 1.8
                            
                            print(celsiusTemp)
                            self.forecastProtocol?.forecastAppTemperature = String("\(Int(celsiusTemp))°C")
                        }
                    }
                })
            }
        })
    }
}
