//
//  Helper.swift
//  EventR
//
//  Created by Karthick Selvaraj on 08/09/21.
//

import Foundation
import UIKit
import SwiftUI

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
    
    static func format(dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "E, dd MMM yyyy h:mm a"
            let formatterString = dateFormatter.string(from: date)
            return formatterString
        }
        return nil
    }
    
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
