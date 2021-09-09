//
//  EventDetailView.swift
//  EventR
//
//  Created by Karthick Selvaraj on 09/09/21.
//

import SwiftUI

struct EventDetailView: View {
    
    @EnvironmentObject var favouriteHandler: FavouriteHandler
    var event: Event
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(event.title)
                        .font(.title2)
                        .bold()
                        .minimumScaleFactor(0.75)
                    Spacer()
                    Button(action: {
                        favouriteHandler.toggleFav(id: event.id)
                    }, label: {
                        Image(systemName: favouriteHandler.isFavourite(id: event.id) ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(.pink)
                    })
                    .frame(width: 50, height: 50, alignment: .center)
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
                .frame(height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
                Text(event.venue.displayLocation)
                    .font(.title3)
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
        EventDetailView(event: Helper.fetchSampleEvents().events[7])
    }
}
