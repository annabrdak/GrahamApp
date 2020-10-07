//
//  GrahamWidget.swift
//  GrahamWidget
//
//  Created by Anna Brdak on 25/09/2020.
//  Copyright © 2020 Anna Brdak. All rights reserved.
//
#if !targetEnvironment(macCatalyst)
import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct GrahamWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        //Text(entry.date, style: .time)
        VStack {
            Image("graham_app_icon-2-removebg-preview")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.all)
                
            //Text("trololo").padding()
        }
    }
}

@main
struct GrahamWidget: Widget {
    
    let kind: String = "GrahamWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            GrahamWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Graham widget")
        .description("This widget only displays a cat because why the fuck not.")
    }
}

struct GrahamWidget_Previews: PreviewProvider {
    static var previews: some View {
        GrahamWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
#endif
