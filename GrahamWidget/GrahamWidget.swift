//
//  GrahamWidget.swift
//  GrahamWidget
//
//  Created by Anna Brdak on 25/09/2020.
//  Copyright © 2020 Anna Brdak. All rights reserved.
//
//#if !targetEnvironment(macCatalyst)
import WidgetKit
import SwiftUI

@main
struct GrahamWidget: Widget {
    
    let kind: String = "GrahamWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WeatherTimelineProvider()) { entry in
            GrahamWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Graham widget")
        .description("This widget only displays the voltage because why the fuck not.")
    }
}

struct GrahamWidget_Previews: PreviewProvider {
    static var previews: some View {
        GrahamWidgetEntryView(entry: WeatherEntry.stub)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
//#endif
