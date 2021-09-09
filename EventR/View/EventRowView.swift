//
//  EventRowView.swift
//  EventR
//
//  Created by Karthick Selvaraj on 08/09/21.
//

import SwiftUI

struct EventRowView: View {
    
    var event: Event
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: event.performers.first?.images.huge ?? "")!) {
                Text("Loading")
            } image: {
                Image(uiImage: $0)
                    .resizable()
            }
            .frame(width: 70, height: 70, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            VStack(alignment: .leading) {
                Text(event.title)
                    .bold()
                Text(event.venue.displayLocation)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text(event.datetimeUTC)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .shadow(color: .gray, radius: 3, x: 3, y: 3)
        .frame(height: 100, alignment: .center)
    }
}

struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(event: Helper.fetchSampleEvents().events.first!)
    }
}
