//
//  EventDetailView.swift
//  EventR
//
//  Created by Karthick Selvaraj on 09/09/21.
//

import SwiftUI

struct EventDetailView: View {
    var event: Event
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.title)
                    .bold()
                AsyncImage(url: URL(string: event.performers.first?.images.huge ?? "")!) {
                    RoundedRectangle(cornerRadius: 5)
                        .background(Color.secondary)
                        .opacity(0.1)
                        .redacted(reason: .placeholder)
                } image: {
                    Image(uiImage: $0)
                        .resizable()
                }
                .frame(height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                Text(event.venue.displayLocation)
                    .font(.title2)
                Text(Helper.format(dateString: event.datetimeLocal) ?? "-")
                    .bold()
                    .foregroundColor(.secondary)
                Text(event.eventDescription)
                    .padding(.top, 3)
                Spacer()
            }
        }
        .padding()
        .navigationBarTitle(Text("Details"), displayMode: .inline)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: Helper.fetchSampleEvents().events.first!)
    }
}
