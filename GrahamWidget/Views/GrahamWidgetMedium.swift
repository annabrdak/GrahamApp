//
//  GrahamWidgetMedium.swift
//  GrahamWidgetExtension
//
//  Created by Anna Brdak on 08/10/2020.
//  Copyright © 2020 Anna Brdak. All rights reserved.
//

import SwiftUI
import WidgetKit

struct GrahamWidgetMedium: View {
    
    var entry: WeatherEntry
    
    var body: some View {
        ZStack {
            Image("backgroundMedium").resizable()
            
            //MARK: - Temperature stack
            HStack {
                VStack(alignment: .leading, spacing: 2.0) {
                    TemperatureView(temp: entry.weatherData.temperatureToDisplay)
                    
                    //MARK: - Humidity stack
                    HStack {
                        LabelView(text: "Humidity:")
                        EntryView(entry: entry.weatherData.humidityToDisplay)
                    }
                    //MARK: - Pressure stack
                    HStack {
                        LabelView(text: "Pressure:")
                        EntryView(entry: entry.weatherData.pressureToDisplay)
                    }
                    //MARK: - Voltage stack
                    HStack {
                        LabelView(text: "Voltage:")
                        EntryView(entry: entry.weatherData.voltageToDisplay)
                    }
                    //MARK: - Air quality stack
                    HStack {
                        LabelView(text: "PM2.5:")
                        EntryView(entry: entry.weatherData.pm2_5)
                    }
                    HStack {
                        LabelView(text: "PM10:")
                        EntryView(entry: entry.weatherData.pm10)
                    }
                }.padding([.top, .leading, .bottom])
                
                //MARK: - Message stack
                VStack(alignment: .trailing) {
                    MessageView(message: entry.weatherData.message)
                    Spacer()
                }.padding()
                
            }
        }
    }
}

struct GrahamWidgetMedium_Previews: PreviewProvider {
    static var previews: some View {
        GrahamWidgetMedium(entry: WeatherEntry.stub).previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}



