//
//  EventListViewModel.swift
//  EventR
//
//  Created by Karthick Selvaraj on 08/09/21.
//

import Foundation
import Combine

protocol EventListViewModelProtocol {
    var events: [Event] { get set }
    var searchText: String? { get set }
    
    func fetchEvents(paginating: Bool, shouldReset: Bool)
}

class EventListViewModel: NSObject, ObservableObject, EventListViewModelProtocol {
    
    @Published var events: [Event] = []
    @Published var searchText: String?
    @Published var isFetching = true
    
    var isAllEventsFetched = false
    var currentPage = 0
    let perPage = 20
    
    
    private var cancellables: Set<AnyCancellable> = []
    
    override init() {
        super.init()
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.fetchEvents(paginating: false, shouldReset: true)
            }
            .store(in: &cancellables)
        
    }
    
    
    // MARK: - Custom methods
    
    func fetchEvents(paginating: Bool = false, shouldReset: Bool) {
        
        if shouldReset {
            currentPage = 0
        }
        
        var urlString = "https://api.seatgeek.com/2/events?client_id=MjMyNTM0MzR8MTYzMTEyMDQwMy43NTE3MTI2&per_page=\(perPage)"
        if let searchText = searchText?.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), !searchText.isEmpty {
            urlString.append("&q=\(searchText)&page=\(currentPage + 1)")
        } else { // For any invalid search text, fetch default events list
            currentPage = paginating ? currentPage + 1 : 1
            urlString.append("&page=\(currentPage)")
        }
        
        guard let url = URL(string: urlString) else { return }
        
        isFetching = true
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { $0.data }
            .decode(type: EventResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .catch { _ in Just(EventResponse(events: [], meta: Meta(total: 0, took: 0, page: 0, perPage: 0))) }
            .sink { [weak self] in
                guard let self = self else { return }
                self.isFetching = false
                if paginating && !shouldReset {
                    self.events.append(contentsOf: $0.events)
                } else {
                    self.events = $0.events
                }
                
                // Check whether all data is fetched or not
                self.isAllEventsFetched = ($0.events.count < self.perPage)
            }
            .store(in: &cancellables)
    }
    
}
