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
                SearchView(searchText: $searchText, isFetching: viewModel.isFetching)
                    .onChange(of: searchText, perform: { value in
                        viewModel.searchText = searchText
                    })
                
                ZStack {
                    if viewModel.events.count == 0 {
                        if viewModel.isFetching {
                            LoadingView()
                        } else {
                            Text("No results found")
                                .foregroundColor(.secondary)
                        }
                    } else {
                        #warning("Need to fix the issue in automatic deselecting the selected row in the list")
                        List {
                            ForEach(viewModel.events) { event in
                                ZStack(alignment: .leading) {
                                    NavigationLink(
                                        destination: EventDetailView(event: event)) {
                                        EmptyView()
                                            .buttonStyle(PlainButtonStyle())
                                    }
                                    .opacity(0)
                                    
                                    EventRowView(event: event)
                                        .buttonStyle(PlainButtonStyle())
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            
                            if !viewModel.isAllEventsFetched && viewModel.events.count > 0 {
                                LoadingView()
                                .onAppear(perform: {
                                    viewModel.fetchEvents(paginating: true, shouldReset: false)
                                })
                            }
                        }
                        .listStyle(PlainListStyle())
                        .resignKeyboardOnDragGesture()
                    }
                    
                }
                Spacer()
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

struct LoadingView: View {
    
    var body: some View {
        HStack(spacing: 10) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            Text("Loading...")
                .foregroundColor(.secondary)
        }
        .padding()
    }
    
}
