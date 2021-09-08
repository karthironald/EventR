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
    }
}

struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(event: Helper.fetchSampleEvents().events.first!)
    }
}
