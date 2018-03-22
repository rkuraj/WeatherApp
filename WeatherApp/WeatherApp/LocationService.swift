//
//  LocationService.swift
//  WeatherApp
//
//  Created by Robert Kuraj on 21.03.2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation

class LocationService {

    let locationAPIKey:String?
    let locationBaseURL:URL?
    
    init(APIKey:String) {
        self.locationAPIKey = APIKey
        self.locationBaseURL = URL(string: "https://maps.googleapis.com/maps/api/geocode/json?address=")
    }
    
    func getCoordinationsForLocation(location:String) {
        let locationURL = URL(string: "\(locationBaseURL!)\(location)&key=\(locationAPIKey!)")
        print(locationURL!)
    }
}
