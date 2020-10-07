//
//  WeatherData.swift
//  GrahamApp
//
//  Created by Anna Brdak on 05/09/2020.
//  Copyright © 2020 Anna Brdak. All rights reserved.
//

import Foundation

struct WeatherData :  Codable {
    let feeds: [Feeds]
    
}

struct Feeds : Codable {
    //temp
    let field1: String
    //humidity
    let field2: String
    //pressure
    let field3: String
    //voltage
    let field4: String
    //pm 2.5
    let field5: String
    //pm 10
    let field6: String
    //datetime
    let created_at: String
}
