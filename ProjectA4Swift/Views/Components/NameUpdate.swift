//
//  CellView.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 22/11/2023.
//

import SwiftUI

struct NameUpdate: View {
    
    @ObservedObject var musicBand: Show
    
    var body: some View {
        Text(musicBand.name)
            .foregroundColor(.black)
    }
}

#Preview {
    NameUpdate(musicBand: Show(name: "ecedce", urlString: "ever", concertDate: .now, color: .red, bandBio: ""))
}
