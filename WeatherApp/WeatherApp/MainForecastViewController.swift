//
//  ViewController.swift
//  WeatherApp
//
//  Created by Robert Kuraj on 21.03.2018.
//  Copyright © 2018 Robert Kuraj. All rights reserved.
//

import UIKit
import MapKit

class MainForecastViewController: UIViewController, ForecastProtocol {
    
    //MARK: Outlets
    @IBOutlet weak var WeatherImageView: UIImageView!
    @IBOutlet weak var CityLabel: UILabel!
    @IBOutlet weak var WeatherSummaryLabel: UILabel!
    @IBOutlet weak var WeatherTemperatureLabel: UILabel!
    @IBOutlet weak var WeatherApparentTemperatureLabel: UILabel!
    @IBOutlet weak var CityTextField: UITextField!
    
    //MARK: Properties
    var cityName: String {
        get {return self.CityLabel.text!}
        set {self.CityLabel.text = newValue}
    }
    
    var forecastSummary: String {
        get {return self.WeatherSummaryLabel.text!}
        set {self.WeatherSummaryLabel.text = newValue}
    }
    
    var forecastIcon: UIImage {
        get {return self.WeatherImageView.image!}
        set {self.WeatherImageView.image = newValue}
    }
    
    var forecastTemperature: String {
        get {return self.WeatherTemperatureLabel.text!}
        set {self.WeatherTemperatureLabel.text = newValue}
    }
    
    var forecastAppTemperature: String {
        get {return self.WeatherApparentTemperatureLabel.text!}
        set {self.WeatherApparentTemperatureLabel.text = newValue}
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Actions
    @IBAction func CheckWeatherForCity(_ sender: UIButton) {
        
        if let cityName = self.CityTextField.text {
            let forecastService = ForecastService(cityName:cityName, forecastProtocol:self)
            forecastService.getForecast()
        } else {
            return
        }
        
    }
}

