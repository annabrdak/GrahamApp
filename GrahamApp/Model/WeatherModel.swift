//
//  WeatherModel.swift
//  GrahamApp
//
//  Created by Anna Brdak on 05/09/2020.
//  Copyright © 2020 Anna Brdak. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    let temperature: String
    let humidity: String
    let pressure: String
    let voltage: String
    let pm2_5: String
    let pm10: String
    
    var temperatureToDisplay: String {
        let doubleTemp = Double(temperature)
        return String(format: "%.0f", doubleTemp!)
    }
    
    var humidityToDisplay: String {
        return "\(humidity) %"
    }
    
    var pressureToDisplay: String {
        let pressureDouble = Double(pressure)
        let pressureInHpa = pressureDouble! / 100
        return "\(String(format: "%.0f", pressureInHpa)) hPa"
    }
    
    var voltageToDisplay: String {
        return "\(voltage) V"
    }
    
    var thermometerImage: String {

        switch Int(temperatureToDisplay)! {
        case ..<10:
            return "thermometer.snowflake"
        case 22...:
            return "thermometer.sun"
        default:
            return "thermometer"
        }
    }
    
    var message: String {
        switch Int(temperatureToDisplay)! {
        case ..<15:
            //return K.lowMessages[Int.random(in: 0...(K.lowMessages.count-1))]
            return K.lowMessages.randomElement()!
        default:
            return K.goodMessages.randomElement()!
        }
    }
}
