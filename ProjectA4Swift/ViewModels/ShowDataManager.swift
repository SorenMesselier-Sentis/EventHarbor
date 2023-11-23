//
//  ShowDataManager.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 21/11/2023.
//

import Foundation
import SwiftUI

class ShowDataManager: ObservableObject {
    @Published var shows: [Show]
    
    init(show: [Show]) {
        self.shows = show
    }

    private func fetchBandInfo(for bandName: String, completion: @escaping (String?, String?) -> Void) {
        let url = "https://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=\(bandName)&api_key=\(API_KEY)&format=json"
        
        guard let apiUrl = URL(string: url) else {
            completion(nil, "Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(LastFMArtistResponse.self, from: data)
                completion(result.artist.bio.summary, nil)
            } catch {
                completion(nil, error.localizedDescription)
            }
        }.resume()
    }

    public func addNewShow(name: String, urlString: String, concertDate: Date, color: Color) {
        fetchBandInfo(for: name) { (bio, error) in
            if let error = error {
                print("Error fetching band info: \(error)")
                return
            }

            let newShow = Show(name: name, urlString: urlString, concertDate: concertDate, color: color, bandBio: bio ?? "")
            
            DispatchQueue.main.async {
                self.shows.append(newShow)
            }
        }
    }

    public func editShow(id: UUID, name: String, urlString: String, concertDate: Date, color: Color) {
        fetchBandInfo(for: name) { (bio, error) in
            if let error = error {
                print("Error fetching band info: \(error)")
                return
            }

            if let index = self.shows.firstIndex(where: { $0.id == id }) {
                self.shows[index].name = name
                self.shows[index].urlString = urlString
                self.shows[index].concertDate = concertDate
                self.shows[index].color = color
                self.shows[index].bandBio = bio ?? ""
            }
        }
    }

    public func deleteShow(id: UUID) {
        if let index = shows.firstIndex(where: { $0.id == id }) {
            shows.remove(at: index)
        }
    }
}
