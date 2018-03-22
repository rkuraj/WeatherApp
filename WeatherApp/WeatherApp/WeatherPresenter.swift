//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Robert Kuraj on 22.03.2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import UIKit

class WeatherPresenter {
    
    //icons: clear-day, clear-night, rain, snow, sleet, wind, fog, cloudy, partly-cloudy-day, or partly-cloudy-night
    
    func getWeatherIcon(icon:String) -> UIImage {
        switch icon {
        case "clear-night":
            return #imageLiteral(resourceName: "ClearNight")
        case "clear-day":
            return #imageLiteral(resourceName: "ClearDay")
        case "rain":
            return #imageLiteral(resourceName: "Rain")
        case "snow":
            return #imageLiteral(resourceName: "Snow")
        case "wind":
            return #imageLiteral(resourceName: "Wind")
        case "fog":
            return #imageLiteral(resourceName: "Fog")
        case "cloudy":
            return #imageLiteral(resourceName: "Cloudy")
        case "partly-cloudy-day":
            return #imageLiteral(resourceName: "PartlyCloudyDay")
        case "partly-cloudy-night":
            return #imageLiteral(resourceName: "PartlyCloudyNight")
        default:
            return #imageLiteral(resourceName: "ClearDay")
        }
    }
    
}
