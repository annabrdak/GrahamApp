//
//  Commons.swift
//  GrahamWidgetExtension
//
//  Created by Anna Brdak on 11/10/2020.
//  Copyright © 2020 Anna Brdak. All rights reserved.
//

import SwiftUI

struct LabelView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.thin)
            .foregroundColor(Color(red: 1.00, green: 0.93, blue: 0.81))
    }
}

struct EntryView: View {
    
    var entry: String
    
    var body: some View {
        Text(entry)
            .font(.subheadline)
            .fontWeight(.light)
            .foregroundColor(Color(red: 1.00, green: 0.93, blue: 0.81))
    }
}

struct TemperatureView: View {
    var temp: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 0.0) {
            Text(temp)
                .font(.largeTitle)
                .foregroundColor(Color(red: 1.00, green: 0.93, blue: 0.81))
                .fontWeight(.semibold)
            Text("°C")
                .font(.largeTitle)
                .fontWeight(.thin)
                .foregroundColor(Color(red: 1.00, green: 0.93, blue:0.81))
        }
    }
}

struct MessageView: View {
    
    var message: String
    
    var body: some View {
        
            Rectangle()
                .cornerRadius(10)
                .frame(width: 125, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(red: 1.00, green: 0.93, blue:0.81, opacity: 1.0))
                .overlay(
                    Text(message)
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.30))
                        .padding(.horizontal))
        
    }
}

