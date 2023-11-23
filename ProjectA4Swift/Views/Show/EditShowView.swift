//
//  ModifyShowView.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 22/11/2023.
//

import SwiftUI

struct EditShowView: View {
    @Binding var show: Show
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var showDataManager: ShowDataManager
    
    @State private var newName: String = ""
    @State private var newURLString: String = ""
    @State private var newConcertDate: Date = Date()
    @State private var newColor: Color = .blue
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Show edit")) {
                    TextField("Name", text: $newName)
                    TextField("Image (URL)", text: $newURLString)
                    AsyncImage(url: URL(string: newURLString)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView("Loading...")
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                .frame(height: 150)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                        case .failure:
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.red)
                                .frame(height: 150)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .padding()
                    DatePicker("Concert Date", selection: $newConcertDate, in: Date()..., displayedComponents: .date)
                    ColorPicker("Color", selection: $newColor)
                }
                
                Section {
                    Button("Save Changes") {
                        saveChanges()
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Edit Show")
        }
        .onAppear {
            // Set initial values based on the existing show
            newName = show.name
            newURLString = show.urlString
            newConcertDate = show.concertDate
            newColor = show.color
        }
    }

    private func saveChanges() {
        showDataManager.editShow(id: show.id,
                                 name: newName.isEmpty ? show.name : newName,
                                 urlString: newURLString.isEmpty ? show.urlString : newURLString,
                                 concertDate: newConcertDate,
                                 color: newColor)
    }
}

struct EditShowView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleShows: [Show] = [
            Show(name: "Show name", urlString: "", concertDate: Date(), color: .blue, bandBio: ""),
        ]
        
        EditShowView(show: .constant(sampleShows[0]))
            .environmentObject(ShowDataManager(show: sampleShows))
    }
}

