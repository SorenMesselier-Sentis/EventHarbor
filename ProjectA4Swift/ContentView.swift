//
//  ContentView.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    let musicShow = [Show]()

    @State private var showDetails = false

    var body: some View {
        NavigationView {
            VStack {
                Text("All music show")
                    .font(.largeTitle)
                    .padding()

                List(musicShow) { musicBand in
                    NavigationLink(destination: Text("Details for \(musicBand.name)")) {
                        Text(musicBand.name)
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                Spacer()

                Button("Add new show") {
                    showDetails.toggle()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                .sheet(isPresented: $showDetails) {
                    NewConcertScreen(show: <#Binding<[Show]>#>)
                }
                .padding()
            }
            .navigationTitle("Music Bands")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
