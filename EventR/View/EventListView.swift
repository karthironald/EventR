//
//  EventListView.swift
//  EventR
//
//  Created by Karthick Selvaraj on 08/09/21.
//

import SwiftUI

struct EventListView: View {
    
    @StateObject var viewModel = EventListViewModel()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchView(searchText: $searchText)
                    .onChange(of: searchText, perform: { value in
                        viewModel.searchText = searchText
                    })
                List {
                    ForEach(viewModel.events) { event in
                        ZStack(alignment: .leading) {
                            NavigationLink(
                                destination: EventDetailView(event: event)) {
                                EmptyView()
                            }
                            .opacity(0)
                            
                            EventRowView(event: event)
                        }
                    }
                    
                    if !viewModel.isAllEventsFetched && viewModel.events.count > 0 {
                        HStack(spacing: 10) {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                            Text("Loading...")
                                .foregroundColor(.secondary)
                        }
                        
                        .padding()
                        .onAppear(perform: {
                            viewModel.fetchEvents(paginating: true, shouldReset: false)
                        })
                    }
                }
                .listStyle(PlainListStyle())
                .resignKeyboardOnDragGesture()
            }
            .padding(0)
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
