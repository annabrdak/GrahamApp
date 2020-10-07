//
//  WeatherManager.swift
//  GrahamApp
//
//  Created by Anna Brdak on 05/09/2020.
//  Copyright © 2020 Anna Brdak. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    
    let weatherURL = "https://api.thingspeak.com/channels/723657/feeds.json?results=1&fbclid=IwAR1yAL86j3Fw_su-FF59hBhsbjV6qrvsBBApGZTiDPuPE-9jHhAhq6wUpf8"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather() {
        performRequest(stringURL: weatherURL)
    }
    
    func performRequest(stringURL: String){
        if let url = URL(string: stringURL){
            let session = URLSession(configuration: .default)
            //let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    
                    if let weather = self.parseJSON(weatherData: safeData){
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
//            for feed in decodedData.feeds{}
            

            let temp = decodedData.feeds[0].field1
            let humidity = decodedData.feeds[0].field2
            let pressure = decodedData.feeds[0].field3
            let voltage = decodedData.feeds[0].field4
            let pm2_5 = decodedData.feeds[0].field5
            let pm10 = decodedData.feeds[0].field6
            
            let weather = WeatherModel(temperature: temp, humidity: humidity, pressure: pressure, voltage: voltage, pm2_5: pm2_5, pm10: pm10)
            return weather
            
            
        }
        catch {
            print(error)
            return nil
        }
    }
}
