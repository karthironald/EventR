//
//  EventListView.swift
//  EventR
//
//  Created by Karthick Selvaraj on 08/09/21.
//

import SwiftUI

struct EventListView: View {
    
    @StateObject var viewModel = EventListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.eventsResponse?.events ?? []) { event in
                EventRowView(event: event)
            }
            .onAppear {
                viewModel.fetchEvents()
            }
            .navigationTitle("Events")
        }
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
