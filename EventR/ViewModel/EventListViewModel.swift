//
//  EventListViewModel.swift
//  EventR
//
//  Created by Karthick Selvaraj on 08/09/21.
//

import Foundation

protocol EventListViewModelProtocol {
    var eventsResponse: EventResponse? { get set }
    func fetchEvents()
}

class EventListViewModel: NSObject, ObservableObject, EventListViewModelProtocol {
    
    @Published var eventsResponse: EventResponse?
    
    // MARK: - Custom methods
    func fetchEvents() {
        do {
            if let jsonData = sampleJSon.data(using: .utf8) {
                let eventResponse = try JSONDecoder().decode(EventResponse.self, from: jsonData)
                self.eventsResponse = eventResponse
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
