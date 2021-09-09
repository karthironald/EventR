//
//  EventRowView.swift
//  EventR
//
//  Created by Karthick Selvaraj on 08/09/21.
//

import SwiftUI

struct EventRowView: View {
    
    @EnvironmentObject var favouriteHandler: FavouriteHandler
    
    var event: Event
    
    var body: some View {
        HStack {
            ZStack(alignment: .topLeading) {
                if favouriteHandler.isFavourite(id: event.id) {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 15, height: 15, alignment: .center)
                        .foregroundColor(.pink)
                        .zIndex(1)
                        .offset(x: -7.5, y: -7.5)
                }
            
                AsyncImage(url: URL(string: event.performers.first?.images.huge ?? "")!) {
                    RoundedRectangle(cornerRadius: 5)
                        .background(Color.secondary)
                        .opacity(0.1)
                        .redacted(reason: .placeholder)
                } image: {
                    Image(uiImage: $0)
                        .resizable()
                }
                .frame(width: 70, height: 70, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            VStack(alignment: .leading) {
                Text(event.title)
                    .bold()
                Text(event.venue.displayLocation)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text(Helper.format(dateString: event.datetimeLocal) ?? "-")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .buttonStyle(PlainButtonStyle())
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
