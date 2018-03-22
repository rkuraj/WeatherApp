//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Robert Kuraj on 21.03.2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService {
    
    let forecastBaseURL: URL?
    let forecastAPIKey: String? //90079ba1c0a1e012447faecf7635fcdd
    
    init(APIKey:String) {
        self.forecastAPIKey = APIKey
        self.forecastBaseURL = URL(string: "https://api.darksky.net/forecast/")
    }
    
    func getCurrentWeatherForCoordinates(coordinates:LocationCoordinates, completion: @escaping (CurrentWeather?) -> ()){
        
        let lat = coordinates.latitude
        let lng = coordinates.longitude
        
        if let forecastURL = URL(string: "\(self.forecastBaseURL!)\(self.forecastAPIKey!)/\(String(describing: lat)),\(String(describing: lng))") {
            
            print(forecastURL)
            
            Alamofire.request(forecastURL).responseJSON(completionHandler: {
                (response) in
                
                if let responseDictionary = response.value as? [String:Any] {
                    if let weatherDictionary = responseDictionary["currently"] as? [String:Any] {
                        let currentWeather = CurrentWeather(weatherDictionary: weatherDictionary)
                        
                        print(currentWeather!)
                        
                        completion(currentWeather)
                    } else {
                        completion(nil)
                    }
                }
            })
        }
    }
}
