//
//  ImageView.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 20/11/2023.
//
import SwiftUI

struct ImageView: View {
    var imageName: String

    var body: some View {
        ScrollView {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Text("Titre de l'image")
                .font(.title)
                .padding()

            Text("Description de l'image.")
                .padding()
        }
        .navigationBarTitle("Détails de l'Image", displayMode: .inline)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageName: "image1")
    }
}
