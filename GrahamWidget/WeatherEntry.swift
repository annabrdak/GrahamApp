//
//  WeatherEntry.swift
//  GrahamWidgetExtension
//
//  Created by Anna Brdak on 07/10/2020.
//  Copyright © 2020 Anna Brdak. All rights reserved.
//

import Foundation
import WidgetKit

struct WeatherEntry: TimelineEntry {
    var date: Date
    
    let weatherData: WeatherModel
    var isPlaceholder = false
}

extension WeatherEntry {
    static var stub: WeatherEntry {
        WeatherEntry(date: Date(), weatherData: .init(temperature: "20", humidity: "79", pressure: "99999", voltage: "3.79", pm2_5: "12", pm10: "23"))
    }
    
    static var placeholder: WeatherEntry {
        WeatherEntry(date: Date(), weatherData: .init(temperature: "15.22", humidity: "77", pressure: "99999", voltage: "3.97", pm2_5: "12", pm10: "23"), isPlaceholder: true)
    }
}

