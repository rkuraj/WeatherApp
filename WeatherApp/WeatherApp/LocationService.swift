//
//  LocationService.swift
//  WeatherApp
//
//  Created by Robert Kuraj on 21.03.2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import Foundation
import Alamofire

class LocationService {

    let locationAPIKey:String?
    let locationBaseURL:URL?
    var locationCoordinates:LocationCoordinates?
    
    init(APIKey:String) {
        self.locationAPIKey = APIKey
        self.locationBaseURL = URL(string: "https://maps.googleapis.com/maps/api/geocode/json?address=")
    }
    
    func getCoordinationsForLocation(location:String, completion: @escaping (LocationCoordinates?) -> ()) {

        if let locationURL = URL(string: "\(locationBaseURL!)\(location)&key=\(locationAPIKey!)"){
            Alamofire.request(locationURL).responseJSON(completionHandler: {(response) in
                if let responseDictionary = response.value as? [String:Any]{
                    if let resultsDictionary = responseDictionary["results"] as? [[String:Any]]{
                        for dictionary in resultsDictionary {
                            let geometry = dictionary["geometry"] as? [String:Any]
                            if let coordinates = geometry!["location"] as? [String:Any] {
                                let latitude = coordinates["lat"] as? Double
                                let longitude = coordinates["lng"] as? Double
                                
                                self.locationCoordinates = LocationCoordinates(latitude:latitude!, longitude:longitude!, cityName: location)
                                
                                completion(self.locationCoordinates)
                                
                            } else {
                                completion(nil)
                            }
                        }
                    }
                }
            })
        }
    }
}
