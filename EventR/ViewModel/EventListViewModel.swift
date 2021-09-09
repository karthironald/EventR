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
    
    func fetchEvents()
}

class EventListViewModel: NSObject, ObservableObject, EventListViewModelProtocol {
    @Published var events: [Event] = []
    
    var isAllEventsFetched = false
    var currentPage = 0
    let perPage = 10
    
    
    private var cancellable: AnyCancellable?
    
    
    // MARK: - Custom methods
    
    func fetchEvents() {
        
        let url = URL(string: "https://api.seatgeek.com/2/events?client_id=MjMyNTM0MzR8MTYzMTEyMDQwMy43NTE3MTI2&per_page=\(perPage)&page=\(currentPage + 1)")!
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { $0.data }
            .decode(type: EventResponse.self, decoder: JSONDecoder())
            .print()
            .receive(on: RunLoop.main)
            .catch { _ in Just(EventResponse(events: [], meta: Meta(total: 0, took: 0, page: 0, perPage: 0))) }
            .sink { [weak self] in
                guard let self = self else { return }
                self.currentPage += 1
                self.events.append(contentsOf: $0.events)
                
                // If count of data received is less than perPage value then it is last page.
                if $0.events.count < self.perPage {
                    self.isAllEventsFetched = true
                }
            }
    }
    
}
