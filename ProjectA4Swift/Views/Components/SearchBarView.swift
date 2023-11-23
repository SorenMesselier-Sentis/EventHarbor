//
//  SearchBarView.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 21/11/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)
        }
    }
}
