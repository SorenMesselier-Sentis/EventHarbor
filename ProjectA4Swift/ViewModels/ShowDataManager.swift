//
//  ShowDataManager.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 21/11/2023.
//

import Foundation

class ShowDataManager: ObservableObject {
    @Published var show: [Show]
    
    init(show: [Show]) {
        self.show = show
    }
    
    public func addNewShow() {
        let newShow = Show(name: "", urlString: "", concertDate: Date(), color: .blue)
        show.append(newShow)
    }
    
    public func deleteShow(id: UUID) {
        if let index = show.firstIndex(where: { $0.id == id }) {
            show.remove(at: index)
        }
    }
    
}
 
