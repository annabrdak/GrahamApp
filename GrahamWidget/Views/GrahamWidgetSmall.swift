//
//  GrahamWidgetSmall.swift
//  GrahamWidgetExtension
//
//  Created by Anna Brdak on 07/10/2020.
//  Copyright © 2020 Anna Brdak. All rights reserved.
//

import SwiftUI
import WidgetKit

struct GrahamWidgetSmall: View {
    
    let entry: WeatherEntry
    
    var body: some View {
        ZStack {
            Image("backgroundSmall").resizable()
            VStack(alignment: .leading, spacing: 2.0) {
                TemperatureView(temp: entry.weatherData.temperatureToDisplay)
                EntryView(entry: "💧 \(entry.weatherData.humidityToDisplay)")
                EntryView(entry: "💨 \(entry.weatherData.pressureToDisplay)")
                EntryView(entry: "⚡️ \(entry.weatherData.voltageToDisplay)")
            }.padding(.bottom)
        }
    }
}

struct GrahamWidgetSmall_Previews: PreviewProvider {
    static var previews: some View {
        GrahamWidgetSmall(entry: WeatherEntry.stub)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}


