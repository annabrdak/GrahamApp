//
//  GrahamWidgetEntryView.swift
//  GrahamWidgetExtension
//
//  Created by Anna Brdak on 07/10/2020.
//  Copyright © 2020 Anna Brdak. All rights reserved.
//

import SwiftUI
import WidgetKit

struct GrahamWidgetEntryView: View {
    
    let entry: WeatherEntry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        switch family {
        case .systemSmall:
            GrahamWidgetSmall(entry: entry)
        case .systemMedium:
            GrahamWidgetMedium(entry: entry)
        default:
            GrahamWidgetSmall(entry: entry)
        }
    }
}

struct GrahamWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        GrahamWidgetEntryView(entry: WeatherEntry.stub).previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
