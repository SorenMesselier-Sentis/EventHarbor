//
//  newConcertScreen.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 20/11/2023.
//

import SwiftUI

struct NewShowView: View {
    
    @Binding var shows: [Show]
    @Binding var newShow: Bool
    
    @State var urlString: String = ""
    @State var name: String = ""
    @State var concertDate = Date()
    @State var bgColor = Color.red
    
    @EnvironmentObject var ShowDataManager: ShowDataManager
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
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
            }

            TextField("Image (URL)", text: $urlString)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Band", text: $name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            DatePicker("Concert Date", selection: $concertDate, in: Date()..., displayedComponents: .date)
                .padding()
            
            ColorPicker("Select the background color", selection: $bgColor)
            Button {
                ShowDataManager.addNewShow(name: name, urlString: urlString, concertDate: concertDate, color: bgColor)
                newShow.toggle()
            } label: {
                Text("Add a new Show")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            Spacer()
        }
        .padding()
        .navigationBarTitle("New Show", displayMode: .inline)
    }
}

struct NewConcertScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewShowView(shows: .constant([]), newShow: .constant(false))
        }
    }
}
