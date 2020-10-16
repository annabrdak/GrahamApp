//
//  GrahamWidgetLarge.swift
//  GrahamWidgetExtension
//
//  Created by Anna Brdak on 11/10/2020.
//  Copyright © 2020 Anna Brdak. All rights reserved.
//

import SwiftUI
import WidgetKit

struct GrahamWidgetLarge: View {
    
    var entry: WeatherEntry
    var body: some View {
        ZStack {
            Image("backgroundSmall").resizable()
            
            VStack(alignment: .leading) {
                TemperatureView(temp: entry.weatherData.temperatureToDisplay)
                MessageView(message: entry.weatherData.message)
                Spacer()
            }.padding()
        }
    }
}

struct GrahamWidgetLarge_Previews: PreviewProvider {
    static var previews: some View {
        GrahamWidgetLarge(entry: WeatherEntry.stub).previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
