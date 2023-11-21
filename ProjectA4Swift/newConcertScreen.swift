//
//  newConcertScreen.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 20/11/2023.
//

import SwiftUI

struct NewConcertScreen: View {
    
    @Binding var show: [Show]
    
    @State var urlString: String = ""
    @State var name: String = ""
    @State var concertDate = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Image preview :")
            if let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        Text("Loading...")
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    case .failure:
                        Text("Failed to load image")
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding()
            }

            TextField("Image (URL)", text: $urlString)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Band", text: $name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            DatePicker("Concert Date", selection: $concertDate, in: Date()..., displayedComponents: .date)
                .padding()
            Button("Add show") {
            
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle("New Concert", displayMode: .inline)
    }
}

struct NewConcertScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewConcertScreen(show: Binding<[Show]>)
        }
    }
}
