//
//  ProjectA4SwiftApp.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 20/11/2023.
//

import SwiftUI

@main
struct ProjectA4SwiftApp: App {
    @ObservedObject var showDataManager = ShowDataManager(show: [])

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(showDataManager)
        }
    }
}
