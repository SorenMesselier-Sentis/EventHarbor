//
//  MusicRow.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 20/11/2023.
//

import SwiftUI

struct MusicRow: View {
    var musicband: MusicBand

    var body: some View {
        Text(musicband.name)
            .padding()
    }
}
