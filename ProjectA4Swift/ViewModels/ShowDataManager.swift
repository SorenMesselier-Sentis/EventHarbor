//
//  ShowDataManager.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 21/11/2023.
//

import Foundation
import SwiftUI

class ShowDataManager: ObservableObject {
    @Published var shows: [Show]
    
    init(show: [Show]) {
        self.shows = show
    }
    
    public func addNewShow(name: String, urlString: String, concertDate: Date, color: Color) {
        let newShow = Show(name: name, urlString: urlString, concertDate: concertDate, color: color)
        shows.append(newShow)
    }
    
    public func editShow(id: UUID, name: String, urlString: String, concertDate: Date, color: Color) {
        if let index = shows.firstIndex(where: { $0.id == id }) {
            shows[index].name = name
            shows[index].urlString = urlString
            shows[index].concertDate = concertDate
            shows[index].color = color
        }
    }
    
    public func deleteShow(id: UUID) {
        if let index = shows.firstIndex(where: { $0.id == id }) {
            shows.remove(at: index)
        }
    }
    
}
