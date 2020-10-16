//
//  WeatherTimelineProvider.swift
//  GrahamWidgetExtension
//
//  Created by Anna Brdak on 07/10/2020.
//  Copyright © 2020 Anna Brdak. All rights reserved.
//

import Foundation
import WidgetKit

struct WeatherTimelineProvider: TimelineProvider {
    
    typealias Entry = WeatherEntry
    let service = WeatherManager.shared
    
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry.placeholder
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> Void) {
        if context.isPreview {
            completion(WeatherEntry.placeholder)
            
        } else {
            fetchWeather { (result) in
                switch result {
                case .success(let entry):
                    completion(entry)
                case .failure(_):
                    completion(WeatherEntry.placeholder)
                }
            }
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> Void) {
        fetchWeather { (result) in
            switch result {
            case .success(let entry):
                let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 10)))
                completion(timeline)
            case .failure(_):
                let timeline = Timeline(entries: [WeatherEntry.placeholder], policy: .after(Date().addingTimeInterval(60 * 2)))
                completion(timeline)
            }
        }
    }
    
    private func fetchWeather(completion: @escaping (Result<WeatherEntry, Error>) -> ()) {
        service.getWeather { (result) in
            switch result {
            case .success(let data):
                let entry = WeatherEntry(date: Date(), weatherData: data)
                completion(.success(entry))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }  
}
