//
//  Helper.swift
//  EventR
//
//  Created by Karthick Selvaraj on 08/09/21.
//

import Foundation

class Helper {
    
    static func fetchSampleEvents() -> EventResponse {
        do {
            if let jsonData = sampleJSon.data(using: .utf8) {
                let eventResponse = try JSONDecoder().decode(EventResponse.self, from: jsonData)
                return eventResponse
            }
        } catch {
            print(error.localizedDescription)
        }
        return EventResponse(events: [], meta: Meta(total: 0, took: 0, page: 0, perPage: 0))
    }
    
}
