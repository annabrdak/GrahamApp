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
            VStack(alignment: .leading, spacing: 2.0) {
                HStack(alignment: .top, spacing: 0.0) {
                    Text("\(entry.weatherData.temperatureToDisplay)")
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 1.00, green: 0.93, blue: 0.81))
                        .fontWeight(.semibold)
                    Text("°C")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .foregroundColor(Color(red: 1.00, green: 0.93, blue:0.81))
                }
                
                Text("💧 \(entry.weatherData.humidityToDisplay)")
                    .font(.subheadline).fontWeight(.thin).foregroundColor(Color(red: 1.00, green: 0.93, blue: 0.81))
                Text("💨 \(entry.weatherData.pressureToDisplay)") .font(.subheadline).fontWeight(.thin).foregroundColor(Color(red: 1.00, green: 0.93, blue: 0.81))
                Text("⚡️ \(entry.weatherData.voltageToDisplay)").font(.subheadline).fontWeight(.thin).foregroundColor(Color(red: 1.00, green: 0.93, blue: 0.81))
            }.padding(.bottom)
        }
    }
}

struct GrahamWidgetMedium_Previews: PreviewProvider {
    static var previews: some View {
        GrahamWidgetMedium(entry: WeatherEntry.stub).previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
