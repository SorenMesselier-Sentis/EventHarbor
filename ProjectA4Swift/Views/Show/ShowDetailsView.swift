//
//  ShowDetailsView.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 21/11/2023.
//

import SwiftUI

struct ShowDetailsView: View {
    @State var show: Show
    @Binding var shows: [Show]
    
    @State private var showingAlert = false
    @State private var isEditShowViewPresented = false
    
    @EnvironmentObject var ShowDataManager: ShowDataManager
    
    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: show.urlString)) { phase in
                switch phase {
                case .empty:
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .imageScale(.large)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .shadow(radius: 5)
                case .failure:
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                        .imageScale(.large)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(show.color, lineWidth: 2)
                        )
                        .shadow(radius: 5)
                @unknown default:
                    EmptyView()
                }
            }
            .padding()

            VStack(alignment: .leading, spacing: 8) {
                Text(show.name)
                    .font(.title)
                    .foregroundColor(.primary)

                Text("Date: \(formattedDate)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("Bio:")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.trailing, 4)

                ScrollView {
                    Text(show.bandBio)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .frame(maxHeight: .infinity)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(color: show.color, radius: 10)
            )
            .padding(EdgeInsets(top: 50, leading: 20, bottom: 20, trailing: 20))
            .navigationBarTitle("\(show.name)'s Show", displayMode: .inline)

            HStack(spacing: 20) {
                NavigationLink(
                    destination: EditShowView(show: $show),
                    isActive: $isEditShowViewPresented
                ) {
                    Button {
                        isEditShowViewPresented = true
                    } label: {
                        Text("Modify")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                
                Button {
                    showingAlert = true
                } label: {
                    Text("Delete")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Delete \(show.name)?"),
                        message: Text("Are you sure you want to delete this show?"),
                        primaryButton: .destructive(Text("Delete")) {
                            ShowDataManager.deleteShow(id: self.show.id)
                        },
                        secondaryButton: .cancel()
                    )
                }
            }
            .padding()
        }
    }

    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: show.concertDate)
    }
}

struct ShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleShows: [Show] = [
            Show(name: "Show name", urlString: "", concertDate: Date(), color: .blue, bandBio: "This is a sample bio."),
        ]

        return ShowDetailsView(show: sampleShows[0], shows: .constant(sampleShows))
            .environmentObject(ShowDataManager(show: sampleShows))
    }
}
