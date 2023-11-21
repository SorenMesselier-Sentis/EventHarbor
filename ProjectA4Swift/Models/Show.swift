//
//  Show.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 20/11/2023.
//

import Foundation
import SwiftUI

class Show: Identifiable, ObservableObject {
    let id: UUID = UUID()
    @Published var name: String
    @Published var urlString: String
    @Published var concertDate: Date
    @Published var color: Color
    
    init(name: String, urlString: String, concertDate: Date, color: Color) {
        self.name = name
        self.urlString = urlString
        self.concertDate = concertDate
        self.color = color
    }
}
