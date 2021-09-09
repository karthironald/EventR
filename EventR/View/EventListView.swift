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
            List {
                ForEach(viewModel.events) { event in
                    EventRowView(event: event)
                }
                
                if !viewModel.isAllEventsFetched {
                    HStack(spacing: 10) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                        Text("Loading...")
                            .foregroundColor(.secondary)
                    }
                    .onAppear(perform: {
                        viewModel.fetchEvents()
                    })
                }
            }
            .navigationTitle("Events")
        }
        .onAppear(perform: {
            UITableView.appearance().separatorStyle = .none
            UITableViewCell.appearance().selectionStyle = .none
        })
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
