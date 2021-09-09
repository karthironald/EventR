//
//  FavouriteHandler.swift
//  EventR
//
//  Created by Karthick Selvaraj on 09/09/21.
//

import Foundation
import SwiftUI

class FavouriteHandler: ObservableObject {
    @AppStorage("favourite_events") var favouriteEvents: [Int] = []
    
    func toggleFav(id: Int) {
        if let index = favIndex(id: id) {
            favouriteEvents.remove(at: index)
        } else {
            favouriteEvents.append(id)
        }
    }
    
    func isFavourite(id: Int) -> Bool {
        favIndex(id: id) != nil
    }
    
    private func favIndex(id: Int) -> Int? {
        favouriteEvents.firstIndex(of: id)
    }
    
}
