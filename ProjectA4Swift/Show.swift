//
//  Show.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 20/11/2023.
//

import Foundation
import SwiftUI

struct Show: Identifiable {
    let id: UUID = UUID()
    let name: String
    let urlString: String
    let concertDate: Date
}

extension Show {
    static let previewShow: [Show] = [
        Show(name: "ACDC", urlString: "https://imgs.search.brave.com/b-PziH11M_KbQyf0wNlYbL9HGovjKQ1psi_4zsqZklQ/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMucnRsLmZyL35j/Lzc3MHY1MTMvcnRs/Mi93d3cvMTUwMjky/NC1hYy1kYy5qcGc", concertDate: Date())
    ]
}
