//
//  ContentView.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State var musicShow = [Show]()
    @State private var showDetails = false
    @State private var newShow = false
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("All Music Shows")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding()

                SearchBar(text: $searchText)

                List {
                    ForEach(musicShow.filter { searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText) }) { musicBand in
                        NavigationLink(destination: ShowDetailsView(show: musicBand, shows: $musicShow)) {
                            Text(musicBand.name)
                                .foregroundColor(.black)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                Spacer()

                Button("Add a New Show") {
                    newShow.toggle()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                .sheet(isPresented: $newShow) {
                    NewShowView(show: $musicShow, newShow: $newShow)
                }
                .padding()
            }
            .navigationTitle("Event Harbor")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
