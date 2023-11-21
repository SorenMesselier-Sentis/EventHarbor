//
//  TabBarView.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 20/11/2023.
//
import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            Text("Form")
                .tabItem {
                    Label("Publish", systemImage: "star")
                }
            Text("Feature Incomming 🤡")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
