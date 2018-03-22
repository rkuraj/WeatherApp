//
//  ViewController.swift
//  WeatherApp
//
//  Created by Robert Kuraj on 21.03.2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import UIKit

class MainForecastViewController: UIViewController {
    @IBOutlet weak var WeatherImageView: UIImageView!
    @IBOutlet weak var CityLabel: UILabel!
    @IBOutlet weak var WeatherSummaryLabel: UILabel!
    @IBOutlet weak var WeatherTemperatureLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let locationServ = LocationService(APIKey: APIKeys.GoogleAPIKey)
        
        locationServ.getCoordinationsForLocation(location: "Seattle", completion: {
            (locationCoordinates) in

            self.CityLabel.text = locationCoordinates?.cityName
            
            if let coordinates = locationCoordinates {
                let forecastServ = WeatherService(APIKey: APIKeys.WeatherAPIKet)
                forecastServ.getCurrentWeatherForCoordinates(coordinates: coordinates, completion: {
                    (weather) in
                    
                    DispatchQueue.main.async {
                        let presenter = WeatherPresenter()
                        
                        if let icon = weather?.icon {
                            self.WeatherImageView.image = presenter.getWeatherIcon(icon: icon)
                        }
                        
                        if let summary = weather?.summary {
                            self.WeatherSummaryLabel.text = summary
                        }
                        
                        if let temp = weather?.temperature {
                            let celsiusTemp = Double(temp-32) / 1.8
                            self.WeatherTemperatureLabel.text = String("\(Int(celsiusTemp))°C")
                        }
                    }
                })
            }
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

